class CreateUserPages < ActiveRecord::Migration
  def change
    create_table :user_pages do |t|
      t.references :user
      t.references :page
      t.timestamps
    end
  end
end
