class Listing < ActiveRecord::Base

belongs_to :user
default_scope {order(no_bedrooms: :desc)}

has_many :amenities, through: :listing_amenities
has_many :listing_amenities, dependent: :destroy
has_many :reservations
accepts_nested_attributes_for :listing_amenities

mount_uploaders :avatars, AvatarUploader


end
