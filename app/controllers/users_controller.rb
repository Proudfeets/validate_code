require 'csv'
require 'pg'
require 'pry'

class UsersController < ApplicationController

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

  # makes the call to the database, invokes insert_user
  def get_users
   select_users = "SELECT * FROM users"
   ingredients = insert_user do |conn|
     conn.exec(select_users)
    end
  end

# Pulls it all together into index, invokes get_users
  def index
    self.get_users
  end

end
