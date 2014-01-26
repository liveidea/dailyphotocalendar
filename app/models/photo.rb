class Photo < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :likes

	validates :title, presence: true
end
