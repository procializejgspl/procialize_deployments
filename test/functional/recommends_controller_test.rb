require 'test_helper'

class RecommendsControllerTest < ActionController::TestCase
  setup do
    @recommend = recommends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recommends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recommend" do
    assert_difference('Recommend.count') do
      post :create, recommend: { done: @recommend.done, type: @recommend.type, user_id: @recommend.user_id }
    end

    assert_redirected_to recommend_path(assigns(:recommend))
  end

  test "should show recommend" do
    get :show, id: @recommend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recommend
    assert_response :success
  end

  test "should update recommend" do
    put :update, id: @recommend, recommend: { done: @recommend.done, type: @recommend.type, user_id: @recommend.user_id }
    assert_redirected_to recommend_path(assigns(:recommend))
  end

  test "should destroy recommend" do
    assert_difference('Recommend.count', -1) do
      delete :destroy, id: @recommend
    end

    assert_redirected_to recommends_path
  end
end
