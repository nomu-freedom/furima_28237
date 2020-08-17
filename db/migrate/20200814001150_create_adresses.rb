class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :postal_code,                default: "", null: false
      t.integer :until_shipping_id
      t.string :city,               default: "", null: false
      t.string :house_number,       default: "", null: false
      t.string :building_number,    default: ""
      t.integer :phone_number,                   null: false
      t.references :user,                        null: false, foreign_key: true
      t.references :item,                        null:false,  foreign_key: true
      t.timestamps
    end
  end
end
