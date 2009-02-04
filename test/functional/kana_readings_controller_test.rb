require 'test_helper'

class KanaReadingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kana_readings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kana_reading" do
    assert_difference('KanaReading.count') do
      post :create, :kana_reading => { }
    end

    assert_redirected_to kana_reading_path(assigns(:kana_reading))
  end

  test "should show kana_reading" do
    get :show, :id => kana_readings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => kana_readings(:one).id
    assert_response :success
  end

  test "should update kana_reading" do
    put :update, :id => kana_readings(:one).id, :kana_reading => { }
    assert_redirected_to kana_reading_path(assigns(:kana_reading))
  end

  test "should destroy kana_reading" do
    assert_difference('KanaReading.count', -1) do
      delete :destroy, :id => kana_readings(:one).id
    end

    assert_redirected_to kana_readings_path
  end
end
