class CreateEfederativas < ActiveRecord::Migration
  def change
    create_table :efederativas do |t|
      t.string :entidadFederativa

      t.timestamps
    end
  end
end
