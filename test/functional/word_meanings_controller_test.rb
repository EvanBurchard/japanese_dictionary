require 'test_helper'

class WordMeaningsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:word_meanings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create word_meaning" do
    assert_difference('WordMeaning.count') do
      post :create, :word_meaning => { }
    end

    assert_redirected_to word_meaning_path(assigns(:word_meaning))
  end

  test "should show word_meaning" do
    get :show, :id => word_meanings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => word_meanings(:one).id
    assert_response :success
  end

  test "should update word_meaning" do
    put :update, :id => word_meanings(:one).id, :word_meaning => { }
    assert_redirected_to word_meaning_path(assigns(:word_meaning))
  end

  test "should destroy word_meaning" do
    assert_difference('WordMeaning.count', -1) do
      delete :destroy, :id => word_meanings(:one).id
    end

    assert_redirected_to word_meanings_path
  end
end
