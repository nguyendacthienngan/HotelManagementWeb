json.extract! room_price, :id, :price, :price_type, :begin_date, :end_date, :is_available, :created_at, :updated_at
json.url room_price_url(room_price, format: :json)
