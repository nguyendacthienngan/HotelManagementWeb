class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  @@payment_type = [
    { code: "cash", text: "Tiền mặt" },
    { code: "momo", text: "Momo"     }
  ]
  @@gender = {
    "0" => "male",
    "1" => "female"
  }
  @@employee_types = [
    { code: "working", text: "Đi làm" },
    { code: "left", text: "Nghỉ làm" }
  ]
  @@client_types = [
    { code: "traveller", text: "Khách lữ hành" },
    { code: "client", text: "Khách hàng" }
  ]
  @@reservation_statuses = [
    { code: "wait_for_check_in", text: "Đợi để check in" },
    { code: "checked_in", text: "Đã check in" },
    { code: "checked_out_payed", text: "Đã check out và thanh toán" },
  ]
  @@service_statuses = [
    { code: "available", text: "Còn hàng" },
    { code: "out_of_stock", text: "Hết hàng" },
    { code: "wont_import", text: "Không còn nhập" },
  ]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:employee_id, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:employee_id, :email, :password, :current_password)}
  end

  def convert_nested_hash_to_text (hash)
    result = Hash.new
    index = 0
    hash.each do |h|
      result[h[:text]] = index
      index +=1
    end
    return result
  end
end
