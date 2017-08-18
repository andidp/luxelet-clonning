class AddPropertyImageColumnsToProperties < ActiveRecord::Migration[5.1]
  def up
    add_attachment :properties, :property_image
  end

  def down
    remove_attachment :properties, :property_image
  end
end
