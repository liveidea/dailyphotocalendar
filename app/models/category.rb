class Category < ActiveRecord::Base
	has_many :photos
	has_many :likes, through: :photos

	validates :title, presence: true

	def to_param
		title
	end
end
