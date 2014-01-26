class Category < ActiveRecord::Base
	has_many :photos
	has_many :likes, through: :photos

	validates :title, presence: true
end
