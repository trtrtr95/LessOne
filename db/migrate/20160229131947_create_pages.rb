class CreatePages < ActiveRecord::Migration
 def create
   create_table :pages do |t|
      t.string  :name
      t.string  :title
      t.text 	 :body
      t.text 	 :formatted_body
      t.string  :ancestry

      t.timestamps
   end

    add_index :pages
 end
end
