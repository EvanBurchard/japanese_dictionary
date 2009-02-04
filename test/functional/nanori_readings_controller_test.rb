require 'test_helper'

class NanoriReadingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nanori_readings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nanori_reading" do
    assert_difference('NanoriReading.count') do
      post :create, :nanori_reading => { }
    end

    assert_redirected_to nanori_reading_path(assigns(:nanori_reading))
  end

  test "should show nanori_reading" do
    get :show, :id => nanori_readings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => nanori_readings(:one).id
    assert_response :success
  end

  test "should update nanori_reading" do
    put :update, :id => nanori_readings(:one).id, :nanori_reading => { }
    assert_redirected_to nanori_reading_path(assigns(:nanori_reading))
  end

  test "should destroy nanori_reading" do
    assert_difference('NanoriReading.count', -1) do
      delete :destroy, :id => nanori_readings(:one).id
    end

    assert_redirected_to nanori_readings_path
  end
end
