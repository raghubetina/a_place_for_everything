class CreateThings < ActiveRecord::Migration[7.1]
  def change
    create_table :things do |t|
      t.string :name
      t.integer :container_id
      t.integer :owner_id
      t.boolean :exclude_from_search
      t.boolean :can_contain_things
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end
