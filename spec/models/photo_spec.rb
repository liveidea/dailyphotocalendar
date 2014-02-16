require 'spec_helper'

describe Photo do
  it "is invalid without a title" do
  	photo = Photo.new
  	photo.should_not be_valid
  end

  it "includes likes" do
  	like1 = Like.new
  	like2 = Like.new
  	photo = Photo.new(title:"Lol", likes:[like1,like2])
  	photo.likes.should include(like1)
  	photo.likes.should include(like2)
	end 	
end
