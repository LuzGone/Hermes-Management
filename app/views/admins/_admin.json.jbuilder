json.extract! admin, :id, :login, :senha, :created_at, :updated_at
json.url admin_url(admin, format: :json)
