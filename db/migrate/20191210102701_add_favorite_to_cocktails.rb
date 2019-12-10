class AddFavoriteToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :favorite, :boolean, default: false
  end
end
