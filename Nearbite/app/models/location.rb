class Location < ActiveRecord::Base
  has_many :businesses


  def initialize
    @location = Location.find(params[:id])
    @city = Location.find(params[:city])
    @state = Location.find(params[:state])
  end

  def select_label
    @location.each do |l|
      "#{city}"
    end
    # "#{city}, #{state}"
    # "#{}"
  end
end
