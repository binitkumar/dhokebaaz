json.array!(@people) do |person|
  json.extract! person, :id, :story, :incident_time, :dhokebaaz_name, :address, :other_details, :fb_profile_url, :post_as_anonymous, :name, :email, :name_visible_to_public, :recive_update_on_comments, :recive_messages
  json.url person_url(person, format: :json)
end
