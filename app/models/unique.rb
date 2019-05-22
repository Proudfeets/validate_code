class Unique < ActiveRecord::Base
  validates :first_name, null: false
  validates :last_name, null: false

end
