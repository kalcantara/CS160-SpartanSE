class Business < ActiveRecord::Base

  belongs_to :location
  has_many :reviews

end
