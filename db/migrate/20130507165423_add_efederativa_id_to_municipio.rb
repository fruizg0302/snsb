class AddEfederativaIdToMunicipio < ActiveRecord::Migration
  def change
    add_column :municipios, :efederativa_id, :integer
  end
end
