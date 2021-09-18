require 'test_helper'

class ReferringDoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referring_doctor = referring_doctors(:one)
  end

  test "should get index" do
    get referring_doctors_url
    assert_response :success
  end

  test "should get new" do
    get new_referring_doctor_url
    assert_response :success
  end

  test "should create referring_doctor" do
    assert_difference('ReferringDoctor.count') do
      post referring_doctors_url, params: { referring_doctor: { address: @referring_doctor.address, email: @referring_doctor.email, name: @referring_doctor.name, phone: @referring_doctor.phone } }
    end

    assert_redirected_to referring_doctor_url(ReferringDoctor.last)
  end

  test "should show referring_doctor" do
    get referring_doctor_url(@referring_doctor)
    assert_response :success
  end

  test "should get edit" do
    get edit_referring_doctor_url(@referring_doctor)
    assert_response :success
  end

  test "should update referring_doctor" do
    patch referring_doctor_url(@referring_doctor), params: { referring_doctor: { address: @referring_doctor.address, email: @referring_doctor.email, name: @referring_doctor.name, phone: @referring_doctor.phone } }
    assert_redirected_to referring_doctor_url(@referring_doctor)
  end

  test "should destroy referring_doctor" do
    assert_difference('ReferringDoctor.count', -1) do
      delete referring_doctor_url(@referring_doctor)
    end

    assert_redirected_to referring_doctors_url
  end
end
