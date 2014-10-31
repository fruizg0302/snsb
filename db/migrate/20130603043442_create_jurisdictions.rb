class CreateJurisdictions < ActiveRecord::Migration
  def change
    create_table :jurisdictions do |t|
      t.integer :jurisdiction_anterior_id
      t.integer :efederativa_id
      t.string :municipio_id
      t.string :jurisdiction

      t.timestamps
    end
  end
end
