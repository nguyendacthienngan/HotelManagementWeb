json.extract! reservation, :id, :status, :arrivalDate, :leaveDate, :checkInDate, :total, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
