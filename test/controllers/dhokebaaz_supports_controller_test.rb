require 'test_helper'

class DhokebaazSupportsControllerTest < ActionController::TestCase
  setup do
    @dhokebaaz_support = dhokebaaz_supports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dhokebaaz_supports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dhokebaaz_support" do
    assert_difference('DhokebaazSupport.count') do
      post :create, dhokebaaz_support: { ip_address: @dhokebaaz_support.ip_address, message: @dhokebaaz_support.message, post_as_anonymous: @dhokebaaz_support.post_as_anonymous, user_id: @dhokebaaz_support.user_id }
    end

    assert_redirected_to dhokebaaz_support_path(assigns(:dhokebaaz_support))
  end

  test "should show dhokebaaz_support" do
    get :show, id: @dhokebaaz_support
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dhokebaaz_support
    assert_response :success
  end

  test "should update dhokebaaz_support" do
    patch :update, id: @dhokebaaz_support, dhokebaaz_support: { ip_address: @dhokebaaz_support.ip_address, message: @dhokebaaz_support.message, post_as_anonymous: @dhokebaaz_support.post_as_anonymous, user_id: @dhokebaaz_support.user_id }
    assert_redirected_to dhokebaaz_support_path(assigns(:dhokebaaz_support))
  end

  test "should destroy dhokebaaz_support" do
    assert_difference('DhokebaazSupport.count', -1) do
      delete :destroy, id: @dhokebaaz_support
    end

    assert_redirected_to dhokebaaz_supports_path
  end
end
