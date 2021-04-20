json.extract! room_type, :id, :name, :hour_price, :date_price, :past_night_price, :week_price, :month_price, :add_adult_price, :add_child_price, :description, :created_at, :updated_at
json.url room_type_url(room_type, format: :json)
