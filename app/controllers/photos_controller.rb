class PhotosController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show]

	def index
		@photo = Photo.all
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
		
	end

	def new
		@photo = Photo.new
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def random
		@photo = Photo.all.sample
    render layout: false
	end

	def favorite
	
	end

	def like
		@photo = Photo.find(params[:id])
		
		if user_signed_in?
			@like = Like.new
			@like.user = current_user
    	@like.photo = @photo
    	if current_user.likes.where(photo:@photo).count == 0
    		@like.save
    	end
    	@photo.likes_count = @photo.likes.count
    	@photo.save
    			
    end

    render json: {count: @photo.likes.count}
	end

	def create
		@photo = Photo.new(photo_params)
		
		@photo.user = current_user
	    respond_to do |format|
	      if @photo.save
	        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
	        FilmMailer.new(@photo, current_user).deliver
	        format.json { render action: 'show', status: :created, location: @photo }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @photo.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private
	def photo_params
		params.require(:photo).permit(:title, :description, :attachment, :day, :category_id)
	end
end
