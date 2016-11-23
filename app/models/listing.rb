class Listing < ActiveRecord::Base

belongs_to :user
default_scope {order(no_bedrooms: :desc)}

end
