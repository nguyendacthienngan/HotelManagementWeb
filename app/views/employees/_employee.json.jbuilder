json.extract! employee, :id, :name, :type, :citizen_id, :isFemale, :nationality, :date_of_birth, :email, :status, :created_at, :updated_at
json.url employee_url(employee, format: :json)
