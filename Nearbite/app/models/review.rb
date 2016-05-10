class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :business, foreign_key: :business_id
  # validates :business, presence: true
  
  has_many :ingredients
  has_many :directions
  has_many :comments

  accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: proc { |attributes| attributes['step'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :business

  validates :title, :description, :image, presence: true
  has_attached_file :image, styles: { :medium => "400x400#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # attr_accessor :business_id
end
