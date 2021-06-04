require "test_helper"

class RoomPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_price = room_prices(:one)
  end

  test "should get index" do
    get room_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_room_price_url
    assert_response :success
  end

  test "should create room_price" do
    assert_difference('RoomPrice.count') do
      post room_prices_url, params: { room_price: { begin_date: @room_price.begin_date, end_date: @room_price.end_date, is_available: @room_price.is_available, price: @room_price.price, price_type: @room_price.price_type } }
    end

    assert_redirected_to room_price_url(RoomPrice.last)
  end

  test "should show room_price" do
    get room_price_url(@room_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_price_url(@room_price)
    assert_response :success
  end

  test "should update room_price" do
    patch room_price_url(@room_price), params: { room_price: { begin_date: @room_price.begin_date, end_date: @room_price.end_date, is_available: @room_price.is_available, price: @room_price.price, price_type: @room_price.price_type } }
    assert_redirected_to room_price_url(@room_price)
  end

  test "should destroy room_price" do
    assert_difference('RoomPrice.count', -1) do
      delete room_price_url(@room_price)
    end

    assert_redirected_to room_prices_url
  end
end
