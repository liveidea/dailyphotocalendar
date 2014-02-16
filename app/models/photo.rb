class Photo < ActiveRecord::Base
	belongs_to :category
	belongs_to :user

	has_many :likes, :dependent => :destroy
 	
 	mount_uploader :attachment, AttachmentUploader
	validates :title, presence: true

	def self.find_best(d)
		self.where(day:d).order('photos.likes_count DESC').first
	end

	def self.find_best_by_category(d, id)
		self.where(day:d).where(category_id:id).order('photos.likes_count DESC').first
	end
end