require 'test_helper'

class UploadedFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uploaded_file = uploaded_files(:one)
  end

  test "should get index" do
    get uploaded_files_url
    assert_response :success
  end

  test "should get new" do
    get new_uploaded_file_url
    assert_response :success
  end

  test "should create uploaded_file" do
    assert_difference('UploadedFile.count') do
      post uploaded_files_url, params: { uploaded_file: { file: @uploaded_file.file } }
    end

    assert_redirected_to uploaded_file_url(UploadedFile.last)
  end

  test "should show uploaded_file" do
    get uploaded_file_url(@uploaded_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_uploaded_file_url(@uploaded_file)
    assert_response :success
  end

  test "should update uploaded_file" do
    patch uploaded_file_url(@uploaded_file), params: { uploaded_file: { file: @uploaded_file.file } }
    assert_redirected_to uploaded_file_url(@uploaded_file)
  end

  test "should destroy uploaded_file" do
    assert_difference('UploadedFile.count', -1) do
      delete uploaded_file_url(@uploaded_file)
    end

    assert_redirected_to uploaded_files_url
  end
end
