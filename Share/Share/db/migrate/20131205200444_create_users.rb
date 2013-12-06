class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.has_many :post
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
