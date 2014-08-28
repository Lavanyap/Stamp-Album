class AlbumsController < ApplicationController
	 before_filter :authenticate_user!
	def index
		@album = current_user.albums
	end
	def show
		@stamps = Stamp.where(:album_id => params[:id])
		@a = params[:id]
	end
	def new


	end


	def create
		@album = Album.new(album_params)

		if @album.save
			 flash[:notice] = "album created"
			
			 redirect_to :controller=>'albums',:action=>'index'
			end
	end

	private
	def album_params
		params.require(:album).permit(:album_name,:user_id)
	end


end
