class AddAncestryToThings < ActiveRecord::Migration[7.1]
  def change
    add_column :things, :ancestry, :string
    add_index :things, :ancestry
  end
end
