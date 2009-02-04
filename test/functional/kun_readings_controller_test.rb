require 'test_helper'

class KunReadingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kun_readings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kun_reading" do
    assert_difference('KunReading.count') do
      post :create, :kun_reading => { }
    end

    assert_redirected_to kun_reading_path(assigns(:kun_reading))
  end

  test "should show kun_reading" do
    get :show, :id => kun_readings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => kun_readings(:one).id
    assert_response :success
  end

  test "should update kun_reading" do
    put :update, :id => kun_readings(:one).id, :kun_reading => { }
    assert_redirected_to kun_reading_path(assigns(:kun_reading))
  end

  test "should destroy kun_reading" do
    assert_difference('KunReading.count', -1) do
      delete :destroy, :id => kun_readings(:one).id
    end

    assert_redirected_to kun_readings_path
  end
end
