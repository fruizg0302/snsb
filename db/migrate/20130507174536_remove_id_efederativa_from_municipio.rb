class RemoveIdEfederativaFromMunicipio < ActiveRecord::Migration
  def up
    remove_column :municipios, :id_efederativa
  end

  def down
  end
end
