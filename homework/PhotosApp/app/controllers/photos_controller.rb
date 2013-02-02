class PhotosController < ApplicationController

	def index
		@photos = Photo.all
	end


	def new
		@photo = Photo.new
	end


	def create
		@photo = Photo.new
		@photo.title = params[:photo][:title]
		@photo.url = params[:photo][:url]
		@photo.save
		flash[:info] = "Photo added successfully"
		redirect_to photo_url(@photo.id)
	end


	def show
		@photo = Photo.find_by_id(params[:id])
	end


	def edit
		@photo = Photo.find_by_id(params[:id])
	end


	def destroy
		@photo = Photo.find_by_id(params[:id])
		@photo.destroy
		redirect_to photos_url
	end


	def update
		@photo = Photo.find_by_id(params[:id])
		if @photo.update_attributes(params[:photo])
			redirect_to @photo, notice: 'Photo was successfully updated'
		else
			render action: "edit"
		end
	end



end