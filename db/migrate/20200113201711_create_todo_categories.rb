class CreateTodoCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_categories do |t|

      t.timestamps
    end
  end
end
