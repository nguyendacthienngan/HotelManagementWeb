require "test_helper"

class ReservationDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation_detail = reservation_details(:one)
  end

  test "should get index" do
    get reservation_details_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_detail_url
    assert_response :success
  end

  test "should create reservation_detail" do
    assert_difference('ReservationDetail.count') do
      post reservation_details_url, params: { reservation_detail: { date_charged: @reservation_detail.date_charged, quantity: @reservation_detail.quantity, total: @reservation_detail.total } }
    end

    assert_redirected_to reservation_detail_url(ReservationDetail.last)
  end

  test "should show reservation_detail" do
    get reservation_detail_url(@reservation_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_detail_url(@reservation_detail)
    assert_response :success
  end

  test "should update reservation_detail" do
    patch reservation_detail_url(@reservation_detail), params: { reservation_detail: { date_charged: @reservation_detail.date_charged, quantity: @reservation_detail.quantity, total: @reservation_detail.total } }
    assert_redirected_to reservation_detail_url(@reservation_detail)
  end

  test "should destroy reservation_detail" do
    assert_difference('ReservationDetail.count', -1) do
      delete reservation_detail_url(@reservation_detail)
    end

    assert_redirected_to reservation_details_url
  end
end
