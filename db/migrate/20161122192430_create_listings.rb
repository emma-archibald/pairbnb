class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.integer :user_id
      t.integer :nightly_rate
      t.integer :no_bedrooms
      t.integer :no_bathrooms
    
      t.timestamps null: false
    end
  end
end
