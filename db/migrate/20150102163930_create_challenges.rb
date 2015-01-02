class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.references :page
      t.references :success_page
      t.references :fail_page
    end
  end
end
