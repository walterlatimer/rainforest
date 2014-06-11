class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.reference :user

      t.timestamps
    end
  end
end
