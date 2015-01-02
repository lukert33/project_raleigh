class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :text
      t.boolean :has_challenge
      t.references :next_page
    end
  end
end
