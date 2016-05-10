json.array!(@businesses) do |business|
  json.extract! business, :id, :name, :category, :address
  json.url business_url(business, format: :json)
end
