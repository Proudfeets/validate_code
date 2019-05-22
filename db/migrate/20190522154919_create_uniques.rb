class CreateUniques < ActiveRecord::Migration[5.2]
  def change
    create_table :uniques do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :address1
      t.string :address2
      t.string :zip
      t.string :city
      t.string :state_long
      t.string :state
      t.string :phone

    end
  end
end
