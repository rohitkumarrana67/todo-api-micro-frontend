class ChnagesinCoulmns < ActiveRecord::Migration[6.0]
  def change
    remove_column :todos, :task
    add_column :todos, :title, :string
    add_column :todos, :description, :string
  end
end
