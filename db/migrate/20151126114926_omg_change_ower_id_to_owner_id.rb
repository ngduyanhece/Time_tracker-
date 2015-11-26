class OmgChangeOwerIdToOwnerId < ActiveRecord::Migration
  def change
  	rename_column :projects, :ower_id, :owner_id
  end
end
