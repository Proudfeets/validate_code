require 'csv';
require 'pg';
require 'pry';
require 'text';

class UsersController < ApplicationController
  @uniques = []
  @duplicates = []
  # opens and closes a path to the database
  def db_connection
   begin
     connection = PG.connect(dbname: 'validity_code_dev')
     yield(connection)
   ensure
     connection.close if connection
   end
 end

  # handles the CSV file, invokes db_connection
  def insert_user
    CSV.foreach("app/models/normal.csv", headers: true) do |row|
     db_connection do |conn|
       insert_user = "INSERT INTO Users (first_name, last_name, company, email, address1, address2, zip, city, state_long, state, phone) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);"
       values = [row['first_name'], row['last_name'], row['company'], row['email'], row['address1'], row['address2'], row['zip'], row['city'], row['state_long'], row['state'] , row['phone']]
       conn.exec_params(insert_user, values)
     end
   end
  end

  # makes the call to the database, inserts all the users
  def get_users
   select_all_users = "SELECT * FROM users"
   ingredients = insert_user do |conn|
     conn.exec(select_all_users)
    end
  end



# finds potential matches based on first and last names sound
  def metaphone_names
    @users = User.all
    all_first_names = []
    all_last_names = []
    second_copies = []
    @users.each do |user|
      if all_first_names.include?Text::Metaphone.metaphone(user.first_name);
        second_copies << user
        all_first_names << Text::Metaphone.metaphone(user.first_name)
      else if all_last_names.include?Text::Metaphone.metaphone(user.last_name);
        all_last_names << Text::Metaphone.metaphone(user.last_name)
        second_copies << user
      else
        all_first_names << Text::Metaphone.metaphone(user.first_name)
        all_last_names << Text::Metaphone.metaphone(user.last_name)
      end
    end
    end
    @duplicates = second_copies
  end

  def make_uniques
    duplicates = []
    @duplicates.each do |names|
      duplicates << Text::Metaphone.metaphone(names.first_name)
      duplicates << Text::Metaphone.metaphone(names.last_name)
    end
    @users.each do |user|
      if @duplicates.include?Text::Metaphone.metaphone(user.first_name)
        @duplicates << user
      else if @duplicates.include?Text::Metaphone.metaphone(user.last_name);
        @duplicates << user
      else
        @uniques << user
      end
      end
      end
    end
  end

  # Pulls it all together into index, invokes get_users
    def index
      self.get_users
      self.metaphone_names
      self.make_uniques
    end

end
