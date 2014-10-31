class AddClueIdToFormulario < ActiveRecord::Migration
  def change
    add_column :formularios, :clue_id, :string
  end
end
