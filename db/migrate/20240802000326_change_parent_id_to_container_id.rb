class ChangeParentIdToContainerId < ActiveRecord::Migration[7.1]
  def change
    rename_column :things, :parent_id, :container_id
  end
end
