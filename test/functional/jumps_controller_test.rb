require 'test_helper'

class JumpsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jumps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jump" do
    assert_difference('Jump.count') do
      post :create, :jump => { }
    end

    assert_redirected_to jump_path(assigns(:jump))
  end

  test "should show jump" do
    get :show, :id => jumps(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => jumps(:one).id
    assert_response :success
  end

  test "should update jump" do
    put :update, :id => jumps(:one).id, :jump => { }
    assert_redirected_to jump_path(assigns(:jump))
  end

  test "should destroy jump" do
    assert_difference('Jump.count', -1) do
      delete :destroy, :id => jumps(:one).id
    end

    assert_redirected_to jumps_path
  end
end
