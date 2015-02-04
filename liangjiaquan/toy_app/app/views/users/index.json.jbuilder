json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :invoke, :active_record
  json.url user_url(user, format: :json)
end
