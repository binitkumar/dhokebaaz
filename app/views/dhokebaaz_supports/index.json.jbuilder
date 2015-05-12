json.array!(@dhokebaaz_supports) do |dhokebaaz_support|
  json.extract! dhokebaaz_support, :id, :user_id, :ip_address, :message, :post_as_anonymous
  json.url dhokebaaz_support_url(dhokebaaz_support, format: :json)
end
