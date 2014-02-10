require 'test_helper'

class DownloadblesControllerTest < ActionController::TestCase
  setup do
    @downloadble = downloadbles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:downloadbles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create downloadble" do
    assert_difference('Downloadble.count') do
      post :create, downloadble: { asset_dwnld: @downloadble.asset_dwnld, track_id: @downloadble.track_id }
    end

    assert_redirected_to downloadble_path(assigns(:downloadble))
  end

  test "should show downloadble" do
    get :show, id: @downloadble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @downloadble
    assert_response :success
  end

  test "should update downloadble" do
    put :update, id: @downloadble, downloadble: { asset_dwnld: @downloadble.asset_dwnld, track_id: @downloadble.track_id }
    assert_redirected_to downloadble_path(assigns(:downloadble))
  end

  test "should destroy downloadble" do
    assert_difference('Downloadble.count', -1) do
      delete :destroy, id: @downloadble
    end

    assert_redirected_to downloadbles_path
  end
end
