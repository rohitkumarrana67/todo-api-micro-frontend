class AddTypeColumnToTodo < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :type, :string
  end
end
