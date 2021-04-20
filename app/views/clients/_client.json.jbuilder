json.extract! client, :id, :name, :citizen_id, :is_female, :nationality, :date_of_birth, :email, :type, :created_at, :updated_at
json.url client_url(client, format: :json)
