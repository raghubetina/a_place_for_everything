class AddContainedThingsCountToThings < ActiveRecord::Migration[7.1]
  def change
    add_column :things, :contained_things_count, :integer, :default => 0
  end
end
