class RemoveColorToCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :color, :string
  end
end
