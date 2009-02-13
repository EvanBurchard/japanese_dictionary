require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:words)
  end


  test "should show word" do
    get :show, :id => words(:one).id
    assert_response :success
  end

end
