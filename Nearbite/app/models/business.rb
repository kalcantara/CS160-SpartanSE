class Business < ActiveRecord::Base

  belongs_to :location
  has_many :reviews, foreign_key: :business_id

  accepts_nested_attributes_for :reviews

  # attr_accessor :id

end