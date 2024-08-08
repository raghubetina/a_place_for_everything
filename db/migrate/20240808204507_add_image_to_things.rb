class AddImageToThings < ActiveRecord::Migration[7.1]
  def change
    add_column :things, :image, :string
  end
end
