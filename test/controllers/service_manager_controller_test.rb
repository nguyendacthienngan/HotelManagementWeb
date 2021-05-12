require "test_helper"

class ServiceManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get service_manager_index_url
    assert_response :success
  end
end
