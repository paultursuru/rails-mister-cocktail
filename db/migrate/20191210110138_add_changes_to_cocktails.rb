class AddChangesToCocktails < ActiveRecord::Migration[5.2]
  def change
    remove_column :cocktails, :favorite
    add_column :cocktails, :votes, :integer, default: 0
  end
end
