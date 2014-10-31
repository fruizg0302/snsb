class Remove < ActiveRecord::Migration
  def up
    remove_column :formularios, :clues, :clue_id, :municipio_id, :nombre_unidad
  end

  def down
  end
end
