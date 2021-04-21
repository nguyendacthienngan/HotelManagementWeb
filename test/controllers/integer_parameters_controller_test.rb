require "test_helper"

class IntegerParametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @integer_parameter = integer_parameters(:one)
  end

  test "should get index" do
    get integer_parameters_url
    assert_response :success
  end

  test "should get new" do
    get new_integer_parameter_url
    assert_response :success
  end

  test "should create integer_parameter" do
    assert_difference('IntegerParameter.count') do
      post integer_parameters_url, params: { integer_parameter: { param_name: @integer_parameter.param_name, param_value: @integer_parameter.param_value } }
    end

    assert_redirected_to integer_parameter_url(IntegerParameter.last)
  end

  test "should show integer_parameter" do
    get integer_parameter_url(@integer_parameter)
    assert_response :success
  end

  test "should get edit" do
    get edit_integer_parameter_url(@integer_parameter)
    assert_response :success
  end

  test "should update integer_parameter" do
    patch integer_parameter_url(@integer_parameter), params: { integer_parameter: { param_name: @integer_parameter.param_name, param_value: @integer_parameter.param_value } }
    assert_redirected_to integer_parameter_url(@integer_parameter)
  end

  test "should destroy integer_parameter" do
    assert_difference('IntegerParameter.count', -1) do
      delete integer_parameter_url(@integer_parameter)
    end

    assert_redirected_to integer_parameters_url
  end
end
