class ChangeUserToOwnerInProjects < ActiveRecord::Migration
  def change
  	rename_column :projects, :user_id, :ower_id
  end
end
