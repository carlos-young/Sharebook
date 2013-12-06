class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :info

      t.timestamps
    end

  end
end
