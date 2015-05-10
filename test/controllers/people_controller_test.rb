require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { address: @person.address, dhokebaaz_name: @person.dhokebaaz_name, email: @person.email, fb_profile_url: @person.fb_profile_url, incident_time: @person.incident_time, name: @person.name, name_visible_to_public: @person.name_visible_to_public, other_details: @person.other_details, post_as_anonymous: @person.post_as_anonymous, recive_messages: @person.recive_messages, recive_update_on_comments: @person.recive_update_on_comments, story: @person.story }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, person: { address: @person.address, dhokebaaz_name: @person.dhokebaaz_name, email: @person.email, fb_profile_url: @person.fb_profile_url, incident_time: @person.incident_time, name: @person.name, name_visible_to_public: @person.name_visible_to_public, other_details: @person.other_details, post_as_anonymous: @person.post_as_anonymous, recive_messages: @person.recive_messages, recive_update_on_comments: @person.recive_update_on_comments, story: @person.story }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
