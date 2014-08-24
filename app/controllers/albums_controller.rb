class AlbumsController < ApplicationController
	 before_filter :authenticate_user!
	def index
		@album = current_user.albums
	end
	def show
		@stamps = Stamp.where(:album_id => params[:id])
		@a = params[:id]
	end

	def create

	end


end
