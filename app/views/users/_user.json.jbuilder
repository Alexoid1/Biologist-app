json.extract! user, :id, :fullname, :username, :photo, :coverimage, :created_at, :updated_at
json.url user_url(user, format: :json)
