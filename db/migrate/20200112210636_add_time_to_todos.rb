class AddTimeToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :time, :datetime
  end
end
