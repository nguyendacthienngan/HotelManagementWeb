class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :client
  belongs_to :employee
  belongs_to :payment
  has_many :reservation_details
  has_many :services, through: :reservation_details

  accepts_nested_attributes_for :client, :payment

  attr_writer :current_step

  # validates_presence_of :status, :arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults
  # validates_presence_of :status, :if => lambda { |o| o.current_step == "shipping" }

  def not_using_multi_step
    @is_multi_step = false
  end

  def is_using_multi_step
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
