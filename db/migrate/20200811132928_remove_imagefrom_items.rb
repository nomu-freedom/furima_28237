class RemoveImagefromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :image, :text
    add_column :items, :sold, :boolean
  end
end
