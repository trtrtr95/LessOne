class CreatePages < ActiveRecord::Migration
 def change
   create_table :pages do |t|
      t.string  :name, :unique => true
      t.string  :title
      t.text    :html_text
      t.text    :path, :unique => true

      t.timestamps
   end

    add_index :pages, :path, :unique => true
 end
end
