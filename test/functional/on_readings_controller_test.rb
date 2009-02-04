require 'test_helper'

class OnReadingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:on_readings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create on_reading" do
    assert_difference('OnReading.count') do
      post :create, :on_reading => { }
    end

    assert_redirected_to on_reading_path(assigns(:on_reading))
  end

  test "should show on_reading" do
    get :show, :id => on_readings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => on_readings(:one).id
    assert_response :success
  end

  test "should update on_reading" do
    put :update, :id => on_readings(:one).id, :on_reading => { }
    assert_redirected_to on_reading_path(assigns(:on_reading))
  end

  test "should destroy on_reading" do
    assert_difference('OnReading.count', -1) do
      delete :destroy, :id => on_readings(:one).id
    end

    assert_redirected_to on_readings_path
  end
end
