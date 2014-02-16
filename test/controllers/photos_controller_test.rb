require 'test_helper'
include Devise::TestHelpers

class PhotosControllerTest < ActionController::TestCase
	test "should create photo" do
		sign_in User.first
 		assert_difference('Photo.count') do
   	 post :create, photo: {title: 'Some title'}
  	end 
  	assert_redirected_to photo_path(assigns(:photo))
	end

	test "should create photo" do
		sign_in User.first
  	assert_difference('Photo.count') do
   	 post :create, photo: {title: 'Hi', description: 'This is my first photo.'}
  	end
  	assert_redirected_to photo_path(assigns(:photo))
  	assert_equal 'Photo was successfully created.', flash[:notice]
	end
end

