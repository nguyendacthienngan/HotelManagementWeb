class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :employee
  belongs_to :payment
  has_many :reservation_details
  has_many :services, through: :reservation_details
  validates_presence_of :client_citizen_id, :client_name, :arrival_date, :leave_date
  validate :check_if_room_has_been_reserved, :validate_date

  accepts_nested_attributes_for :payment, :room

  attr_writer :current_step

  # validates_presence_of :client, :if => lambda { |o| o.current_step == 2 }
  # validates_presence_of :payment,:if => lambda { |o| o.current_step == 3 }
  # validates_presence_of :status, :arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults, :if => lambda { |o| o.current_step == 1 }
  validates_presence_of :arrival_date, :leave_date, :children, :adults, :if => lambda { |o| o.current_step == 1 }

  def check_if_room_has_been_reserved
    if arrival_date && leave_date
      reserved = Reservation.where(["status = 1 and (arrival_date >= ? and leave_date <= ?) and room_id = ?", "#{arrival_date}", "#{leave_date}", "#{room_id}"])
      if !reserved.empty?
        isThisRoom = false
        reserved.each do |r|
          if r.id == id
            isThisRoom = true
            break
          end
        end
        if isThisRoom == false
          errors.add(:room_id, "đã được đặt trong thời gian này, vui lòng chọn lại ngày khác hoặc chọn phòng khác vào khung thời gian này")
        end
      end
    end

  end

  def validate_date
    if arrival_date && leave_date
      if arrival_date >= leave_date
        errors.add(:arrival_date, "Ngày đến không được sau ngày đi")
      end
    end

  end

  def not_using_multi_step
    @is_multi_step = false
  end

  def multi_step
    @is_multi_step
  end

  def steps
    [1,2,3]
  end

  def current_step
    @is_multi_step = true
    @current_step || steps.first
  end

  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
end
