require 'test_helper'

class KanjiReadingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kanji_readings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kanji_reading" do
    assert_difference('KanjiReading.count') do
      post :create, :kanji_reading => { }
    end

    assert_redirected_to kanji_reading_path(assigns(:kanji_reading))
  end

  test "should show kanji_reading" do
    get :show, :id => kanji_readings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => kanji_readings(:one).id
    assert_response :success
  end

  test "should update kanji_reading" do
    put :update, :id => kanji_readings(:one).id, :kanji_reading => { }
    assert_redirected_to kanji_reading_path(assigns(:kanji_reading))
  end

  test "should destroy kanji_reading" do
    assert_difference('KanjiReading.count', -1) do
      delete :destroy, :id => kanji_readings(:one).id
    end

    assert_redirected_to kanji_readings_path
  end
end
