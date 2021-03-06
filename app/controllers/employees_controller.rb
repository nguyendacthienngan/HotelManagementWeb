class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :isAdmin?

  add_breadcrumb "Trang chủ", :root_path
  add_breadcrumb "Nhân viên", :employees_path

  # GET /employees or /employees.json
  def index
    @employees = Employee.all
    # @types = @@employee_types
    @employeee_type =  @@employee_types
    @employee_gender = @@gender
    @employee_statuses = @@employee_statuses
  end

  # GET /employees/1 or /employees/1.json
  def show
    add_breadcrumb "Xem"
    @employeee_type =  @@employee_types
    @employee_gender = @@gender
    @employee_statuses = @@employee_statuses
  end

  # GET /employees/new
  def new
    add_breadcrumb "Thêm"
    @employee = Employee.new
    @employee_type = @@employee_types
    @employee_type_view = convert_nested_hash_to_text(@employee_type)
    @employee_gender = @@gender
    @employee_gender_view = convert_nested_hash_to_text(@employee_gender)
    @employee_statuses = @@employee_statuses
    @employee_statuses_view = convert_nested_hash_to_text(@employee_statuses)
  end

  # GET /employees/1/edit
  def edit
    add_breadcrumb "Sửa"
    @employee_type = @@employee_types
    @employee_type_view = convert_nested_hash_to_text(@employee_type)
    @employee_gender = @@gender
    @employee_gender_view = convert_nested_hash_to_text(@employee_gender)
    @employee_statuses = @@employee_statuses
    @employee_statuses_view = convert_nested_hash_to_text(@employee_statuses)
  end

  # POST /employees or /employees.json
  def create
    @employee_type = @@employee_types
    @employee_type_view = convert_nested_hash_to_text(@employee_type)
    @employee_gender = @@gender
    @employee_gender_view = convert_nested_hash_to_text(@employee_gender)
    @employee_statuses = @@employee_statuses
    @employee_statuses_view = convert_nested_hash_to_text(@employee_statuses)
    @employee = Employee.new(employee_params)
      if @employee.save
        redirect_to new_user_registration_path(employee_id: @employee.id)
      else
        respond_to do |format|

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json 
  def destroy
    reservations = Reservation.where(employee_id: @employee.id)
    respond_to do |format|
      if !reservations.empty?
        format.html { redirect_to employees_url, :flash => { :error =>  "Không thể xóa vì nhân viên này đang hoạt động" }}
        format.json { head :no_content }
      else
        @employee.destroy
        format.html { redirect_to employees_url, notice: "Nhân viên đã được xóa thành công" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :employee_type, :citizen_id, :gender, :nationality, :date_of_birth, :email, :status, :address, :phone_number)
    end
end
