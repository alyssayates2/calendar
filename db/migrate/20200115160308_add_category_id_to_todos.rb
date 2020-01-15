class AddCategoryIdToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :category_id, :integer 
  end
end
