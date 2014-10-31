class AddEfederativaIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :efederativa_id, :integer
  end
end
