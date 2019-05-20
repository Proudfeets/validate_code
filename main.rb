require 'csv'
require 'pg'

# adds users from CSV to user db
def db_connection
  begin connection = PG.connect(dbname: 'validity_take_home')
    yield(connection)
  ensure
    connection.close
  end
end

CSV.foreach('normal.csv', headers: true) do |row|
  db_connection do |conn|
    insert_user = "INSERT INTO user (first_name, last_name, company, address1, address2, zip, city, state_long, state, phone) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)"
    values = [row['first_name'], row['last_name'], row['company'], row['address1'], row['address2'], row['zip'], row['city'], row['state_long'], row['state'] , row['phone']]
    conn.exec_params(insert_user, values)
  end
end

select_users = "SELECT * FROM users"
ingredients = db_connection do |conn|
  conn.exec(select_users)
end

puts ingredients.to_a
