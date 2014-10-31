class AddUserIdToFormulario < ActiveRecord::Migration
  def change
    add_column :formularios, :user_id, :integer
  end
end
