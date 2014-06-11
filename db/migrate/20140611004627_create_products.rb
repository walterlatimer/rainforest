class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price_in_cents
      t.integer :quantity
      t.text :description
      t.references :category, index: true
      t.boolean :featured

      t.timestamps
    end
  end
end
