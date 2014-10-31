class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
  end
end
