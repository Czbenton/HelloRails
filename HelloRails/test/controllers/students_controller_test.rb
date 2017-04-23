require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @school = schools(:one)
    @student = students(:one)
  end

  test "should get index" do
    get :index, params: { school_id: @school }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { school_id: @school }
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, params: { school_id: @school, student: @student.attributes }
    end

    assert_redirected_to school_student_path(@school, Student.last)
  end

  test "should show student" do
    get :show, params: { school_id: @school, id: @student }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { school_id: @school, id: @student }
    assert_response :success
  end

  test "should update student" do
    put :update, params: { school_id: @school, id: @student, student: @student.attributes }
    assert_redirected_to school_student_path(@school, Student.last)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, params: { school_id: @school, id: @student }
    end

    assert_redirected_to school_students_path(@school)
  end
end
