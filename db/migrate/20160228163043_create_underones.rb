class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :name, :unique => true
      t.text :html_text
      t.text :path, :unique => true


      t.timestamps null: false
    end
    add_index :pages, :path, :unique => true
  end
end
