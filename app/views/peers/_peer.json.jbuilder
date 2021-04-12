json.extract! peer, :id, :username, :email, :religion, :created_at, :updated_at
json.url peer_url(peer, format: :json)
