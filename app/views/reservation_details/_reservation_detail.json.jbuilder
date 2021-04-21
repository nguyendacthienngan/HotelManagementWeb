json.extract! reservation_detail, :id, :date_charged, :quantity, :total, :created_at, :updated_at
json.url reservation_detail_url(reservation_detail, format: :json)
