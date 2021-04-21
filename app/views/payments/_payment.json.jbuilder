json.extract! payment, :id, :reservation_date, :is_paid, :deposit, :temp_total, :check_out_date, :payment_type, :total, :description, :created_at, :updated_at
json.url payment_url(payment, format: :json)
