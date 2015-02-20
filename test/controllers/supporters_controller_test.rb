require 'test_helper'

class SupportersControllerTest < ActionController::TestCase
  setup do
    @supporter = supporters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supporters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supporter" do
    assert_difference('Supporter.count') do
      post :create, supporter: { ejections: @supporter.ejections, matches: @supporter.matches, name: @supporter.name, years_traveling: @supporter.years_traveling }
    end

    assert_redirected_to supporter_path(assigns(:supporter))
  end

  test "should show supporter" do
    get :show, id: @supporter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supporter
    assert_response :success
  end

  test "should update supporter" do
    patch :update, id: @supporter, supporter: { ejections: @supporter.ejections, matches: @supporter.matches, name: @supporter.name, years_traveling: @supporter.years_traveling }
    assert_redirected_to supporter_path(assigns(:supporter))
  end

  test "should destroy supporter" do
    assert_difference('Supporter.count', -1) do
      delete :destroy, id: @supporter
    end

    assert_redirected_to supporters_path
  end
end
