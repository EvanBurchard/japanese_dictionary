require 'test_helper'

class KanjiMeaningsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kanji_meanings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kanji_meaning" do
    assert_difference('KanjiMeaning.count') do
      post :create, :kanji_meaning => { }
    end

    assert_redirected_to kanji_meaning_path(assigns(:kanji_meaning))
  end

  test "should show kanji_meaning" do
    get :show, :id => kanji_meanings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => kanji_meanings(:one).id
    assert_response :success
  end

  test "should update kanji_meaning" do
    put :update, :id => kanji_meanings(:one).id, :kanji_meaning => { }
    assert_redirected_to kanji_meaning_path(assigns(:kanji_meaning))
  end

  test "should destroy kanji_meaning" do
    assert_difference('KanjiMeaning.count', -1) do
      delete :destroy, :id => kanji_meanings(:one).id
    end

    assert_redirected_to kanji_meanings_path
  end
end
