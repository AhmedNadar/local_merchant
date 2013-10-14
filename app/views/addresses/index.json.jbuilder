json.array!(@addresses) do |address|
  json.extract! address, :line1, :line2, :city, :province, :postalcode, :user_id
  json.url address_url(address, format: :json)
end
