require 'test_helper'

class MeetersControllerTest < ActionController::TestCase
  setup do
    @meeter = meeters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meeters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeter" do
    assert_difference('Meeter.count') do
      post :create, meeter: { meeting_id: @meeter.meeting_id, status: @meeter.status, user_id: @meeter.user_id }
    end

    assert_redirected_to meeter_path(assigns(:meeter))
  end

  test "should show meeter" do
    get :show, id: @meeter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeter
    assert_response :success
  end

  test "should update meeter" do
    put :update, id: @meeter, meeter: { meeting_id: @meeter.meeting_id, status: @meeter.status, user_id: @meeter.user_id }
    assert_redirected_to meeter_path(assigns(:meeter))
  end

  test "should destroy meeter" do
    assert_difference('Meeter.count', -1) do
      delete :destroy, id: @meeter
    end

    assert_redirected_to meeters_path
  end
end
