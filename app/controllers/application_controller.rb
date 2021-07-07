include ActionView::Helpers::NumberHelper
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  @@payment_type = [
    { code: "cash", text: "Tiền mặt" },
    { code: "momo", text: "Momo"     }
  ]
  @@gender = [
    { code: "male", text: "Nam" },
    { code: "female", text: "Nữ" },
    { code: "order", text: "Khác" }
  ]
  @@employee_types = [
    { code: "manager", text: "Quản lý" },
    { code: "receptionist", text: "Lễ tân" },
    { code: "vs", text: "Vệ sinh" },
    { code: "bv", text: "Bảo vệ" }
  ]
  @@employee_statuses = [
    { code: "working", text: "Đang làm" },
    { code: "left", text: "Nghỉ việc" }
  ] 
  @@client_types = [
    { code: "traveller", text: "Khách lữ hành" },
    { code: "client", text: "Thành viên" }
  ]
  @@room_types = [
    { code: "x", text: "Standard" },
    { code: "a", text: "Superior Twin" },
    { code: "b", text: "Superior Double" },
    { code: "c", text: "Deluxe Twin" },
    { code: "d", text: "Deluxe Double" },
    { code: "e", text: "Suite Double" }
  ]
  @@room_statuses = [
    { code: "empty", text: "Trống", color: "#000000" },
    { code: "reserved", text: "Đã đặt", color: "#fdc500" },
    { code: "late_arrival", text: "Quá hạn", color: "#c1121f" },
    { code: "nonempty", text: "Đang ở", color: "#003049" }, # Đã check in
    { code: "dirty", text: "Bẩn", color: "#fdf0d5" } #Đã check out
  ]
  @@floor = [
    { code: "mot", text: "1" },
    { code: "hai", text: "2" },
    { code: "ba", text: "3" }
  ]

  @@reservation_statuses = [
    { code: "wait_for_check_in", text: "Đợi để check in" },
    { code: "checked_in", text: "Đã check in" },
    { code: "checked_out_payed", text: "Đã check out và thanh toán" },
  ]

  @@reservation_types = [
    { code: "individual_reservation", text: "Khách lẻ" },
    { code: "cooperate_reservation", text: "Khách đoàn" },
  ]
  @@service_statuses = [
    { code: "available", text: "Còn hàng" },
    { code: "out_of_stock", text: "Hết hàng" },
    { code: "wont_import", text: "Không còn nhập" },
  ]
  @@price_types = [
    { code: "hour_price", text: "Giá theo giờ" },
    { code: "day_price", text: "Giá theo ngày" },
    { code: "week_price", text: "Giá theo tuần" },
    { code: "month_price", text: "Giá theo tháng" },
    { code: "year_price", text: "Giá theo năm" },
    { code: "add_adult_price", text: "Giá thêm 1 người lớn" },
    { code: "add_child_price", text: "Giá thêm 1 trẻ con" },
  ]
  @@reservation_types = [
    { code: "hour_reservation", text: "Đặt theo giờ" },
    { code: "day_reservation", text: "Đặt theo ngày" },
    { code: "week_reservation", text: "Đặt theo tuần" },
    { code: "month_reservation", text: "Đặt theo tháng" },
    { code: "year_reservation", text: "Đặt theo năm" },
  ]
  protected

  def currency_name (currency)
    result = currency.tr('[]', '')
    result = number_to_currency(result, precision: 0, unit: "VND",  format: "%n %u")
    return result
  end

  def currency_value(currency)
    result = currency.tr('VND','')
    result = result.tr(',','')
    result = result.tr(' ','')
    return result
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:employee_id, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:employee_id, :email, :password, :current_password)}
  end

  def convert_nested_hash_to_text (hash)
    result = Hash.new
    index = 1
    hash.each do |h|
      result[h[:text]] = index
      index +=1
    end
    return result
  end

  def convert_nested_hash_to_color (hash)
    result = []
    hash.each do |h|
      result.push(h[:color])
    end
    return result
  end
end
