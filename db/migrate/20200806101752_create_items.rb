class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image,                 null: false
      t.string :name,                null: false
      t.text :explanation,           null: false
      t.integer :category_id,        null: false
      t.integer :status_id,          null: false
      t.integer :delivery_fee_id,    null: false
      t.integer :shipping_origin_id, null: false
      t.integer :until_shipping_id,  null: false
      t.integer :price,              null: false
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end
