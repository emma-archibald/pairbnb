class CreateListingAmenities < ActiveRecord::Migration
  def change
    create_table :listing_amenities do |t|
      t.integer :listing_id
      t.integer :amenity_id
      t.timestamps null: false
    end
    add_foreign_key :listing_amenities, :listings
    add_foreign_key :listing_amenities, :amenities
  end
end
