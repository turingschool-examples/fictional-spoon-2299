class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :complexity
      t.string :genre

      t.timestamps
    end
  end
end
