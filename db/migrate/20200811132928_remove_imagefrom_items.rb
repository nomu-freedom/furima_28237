class RemoveImagefromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :image, :text
  end
end
