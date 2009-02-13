require 'test_helper'

class KanjisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kanjis)
  end


  test "should show kanji" do
    get :show, :id => kanjis(:one).id
    assert_response :success
  end

end
