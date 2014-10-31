class AddJurisdictionIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :jurisdiction_id, :integer
  end
end
