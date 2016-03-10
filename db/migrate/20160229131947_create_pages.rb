class CreatePages < ActiveRecord::Migration
 def create
   create_table :pages do |t|
      t.string  :name, :unique => true
      t.string  :title
      t.text    :path, :unique => true
      t.text 	 :body
      t.text 	 :formatted_body
      t.string  :ancestry

      t.timestamps
   end

    add_index :pages#, :path, :unique => true
 end
end
