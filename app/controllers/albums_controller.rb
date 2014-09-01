class AlbumsController < ApplicationController
	 before_filter :authenticate_user!
	def index
		@album = current_user.albums
	end
	def show
		@stamps = Stamp.where(:album_id => params[:id])
		@a = Album.find(params[:id])
	end
	def new


	end


	def create
		@album = Album.new(album_params)

		if @album.save
			 flash[:notice] = "New Album created"
			
			 redirect_to :controller=>'albums',:action=>'index'
		else
			flash[:error] = "Some thing went wrong, album didn't get created !"

			redirect_to :controller=>'albums',:action=>'index'
		end
	end
	# when you delete an album delete delete all th stmps and shares for that album
	def destroy
		if resource
			resource.destroy
			all_shared_instances
			all_stamps_for_the_album
			flash[:success] = "Album has been deleted"
    	else
    		flash[:error] = "Your attempt to delete the album was unsucessful"
		end
		
		redirect_to :controller=>'albums',:action =>'index'

	end


	private
	def album_params
		params.require(:album).permit(:album_name,:user_id,:image)
	end
	def resource
    @resource ||= current_user.albums.where(:id => params[:id]).first

  end
  # deletes all shared instance of currently deleting album
  def all_shared_instances
    @share ||= current_user.shares.where(:album_id => params[:id])
    @share.each do |share|
    	share.destroy
    end
  end
  def all_stamps_for_the_album
  	 @stamp ||= current_user.stamps.where(:album_id => params[:id])
     @stamp.each do |stamp|
    	stamp.destroy
    end
end

end
