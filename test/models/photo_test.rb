require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "day photos truth" do
  	category1 = Category.new(title:"Nature")
  	category1.save
  	category2 = Category.new(title:"Sport")
  	category2.save

  	photo1 = Photo.new(title:"Cat", category:category1, day:(Date.new(2014, 1, 23)))
  	photo1.save
  	photo2 = Photo.new(title:"Grass", category:category1, day:(Date.new(2014, 1, 23)))
  	photo2.save
  	photo3 = Photo.new(title:"Rugby", category:Category.last, day:(Date.new(2014, 1, 25)))
  	photo3.save

  	res = Photo.where(day:(Date.new(2014, 1, 23))).count

    assert res == 2
  end

  test "category likes" do
  	category1 = Category.new(title:"Nature")
  	category1.save
  	category2 = Category.new(title:"Sport")
  	category2.save

  	photo1 = Photo.new(title:"Cat", category:category1, day:(Date.new(2014, 1, 23)))
  	photo1.save
  	photo2 = Photo.new(title:"Grass", category:category1, day:(Date.new(2014, 1, 23)))
  	photo2.save
  	photo3 = Photo.new(title:"Rugby", category:Category.last, day:(Date.new(2014, 1, 23)))
  	photo3.save

  	like1 = Like.new(photo:photo1)
  	like1.save
  	like2 = Like.new(photo:photo1)
  	like2.save
  	like3 = Like.new(photo:photo3)
  	like3.save
  	like4 = Like.new(photo:photo1)
  	like4.save

  	if category1.likes.count > category2.likes.count
  		res = category1.title
  	else
  		res = category2.title
  	end

  	assert res == "Nature"
  end
end
