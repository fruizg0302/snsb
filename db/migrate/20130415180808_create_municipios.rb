class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.integer :id_efederativa
      t.integer :id_municipio_ant
      t.string :municipio

      t.timestamps
    end
  end
end
