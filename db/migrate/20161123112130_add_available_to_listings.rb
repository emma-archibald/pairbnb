class AddAvailableToListings < ActiveRecord::Migration
  def change
    add_column :listings, :availale, :boolean
  end

end
