class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.belongs :recipe, index:true , foreign_key:true
      t.belongs :food, index:true , foreign_key:true
      t.timestamps
    end
  end
end
