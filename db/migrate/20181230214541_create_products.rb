class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.string :short_description
      t.string :full_description
      t.boolean :in_stock
      t.string :preview_image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
