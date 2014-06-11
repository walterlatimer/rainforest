json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :display, :avatar_url, :access
  json.url user_url(user, format: :json)
end
