class Listing < ActiveRecord::Base

belongs_to :user
default_scope {order(no_bedrooms: :desc)}

include PgSearch
pg_search_scope :search_by_description, :against => :description

scope :state, -> (state) { where state: state}
scope :no_bedrooms, -> (no_bedrooms) { where no_bedrooms: no_bedrooms}
scope :no_bathrooms, -> (no_bathrooms) { where no_bathrooms: no_bathrooms}
scope :nightly_rate, ->(min, max) { where('nightly_rate > ? AND nightly_rate < ?', min, max) }

scope :has_amenities, ->(names) { joins(:amenities).where("amenities.name" => names) }


has_many :amenities, through: :listing_amenities
has_many :listing_amenities, dependent: :destroy
has_many :reservations
accepts_nested_attributes_for :listing_amenities

mount_uploaders :avatars, AvatarUploader

  def self.states
    return ["","New South Wales", "Victoria", "Western Australia", "Australian Capital Territory", "Northern Territory", "Tasmania", "South Australia"]
  end

end
