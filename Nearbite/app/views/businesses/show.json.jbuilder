json.extract! @business, :id, :name, :category, :address, :location_id, :created_at, :updated_at
json.extract! @review, :id, :title, :description, :image, :business_id, :created_at, :updated_at

