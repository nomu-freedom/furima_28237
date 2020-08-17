class RenameShippingOriginColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :shipping_origin, :shipping_origin_id
  end
end
