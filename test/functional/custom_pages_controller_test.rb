require 'test_helper'

class CustomPagesControllerTest < ActionController::TestCase
  setup do
    @custom_page = custom_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_page" do
    assert_difference('CustomPage.count') do
      post :create, custom_page: { display: @custom_page.display, page_content: @custom_page.page_content }
    end

    assert_redirected_to custom_page_path(assigns(:custom_page))
  end

  test "should show custom_page" do
    get :show, id: @custom_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_page
    assert_response :success
  end

  test "should update custom_page" do
    put :update, id: @custom_page, custom_page: { display: @custom_page.display, page_content: @custom_page.page_content }
    assert_redirected_to custom_page_path(assigns(:custom_page))
  end

  test "should destroy custom_page" do
    assert_difference('CustomPage.count', -1) do
      delete :destroy, id: @custom_page
    end

    assert_redirected_to custom_pages_path
  end
end
