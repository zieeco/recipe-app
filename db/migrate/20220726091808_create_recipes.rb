# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation_time, default: 0
      t.string :cooking_time, default: 0
      t.string :description
      t.boolean :public
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
