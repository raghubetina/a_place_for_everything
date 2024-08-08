class AddEmbeddingToThings < ActiveRecord::Migration[7.1]
  def change
    add_column :things, :embedding, :vector, limit: 2000
  end
end
