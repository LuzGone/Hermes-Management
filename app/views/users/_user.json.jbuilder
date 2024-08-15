json.extract! user, :id, :nome, :matricula, :login, :senha, :created_at, :updated_at
json.url user_url(user, format: :json)
