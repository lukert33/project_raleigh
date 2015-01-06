class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :text
      t.references :next_page
      t.timestamps
    end
  end
end
