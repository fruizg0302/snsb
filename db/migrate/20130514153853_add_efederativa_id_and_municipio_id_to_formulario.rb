class AddEfederativaIdAndMunicipioIdToFormulario < ActiveRecord::Migration
  def change
    add_column :formularios, :efederativa_id, :integer
    add_column :formularios, :municipio_id, :integer
  end
end
