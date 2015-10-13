class WelcomeController < ApplicationController
	def index
		if params[:image_id].present?
		  preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
		  raise "Invalid upload signature" if !preloaded.valid?
		  @model.image_id = preloaded.identifier
		end
	end
end