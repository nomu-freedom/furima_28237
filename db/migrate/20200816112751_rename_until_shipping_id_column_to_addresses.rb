class RenameUntilShippingIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :until_shipping_id, :shipping_origin
  end
end
