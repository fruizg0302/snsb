class AddJurisdictionIdToFormulario < ActiveRecord::Migration
  def change
    add_column :formularios, :jurisdiction_id, :integer
  end
end
