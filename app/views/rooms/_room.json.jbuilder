json.extract! room, :id, :beds, :status, :floor, :capacity, :price, :roomType, :description, :created_at, :updated_at
json.url room_url(room, format: :json)
