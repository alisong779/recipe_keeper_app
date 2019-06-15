class RemoveCategoryIdFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :category_id
  end
end
