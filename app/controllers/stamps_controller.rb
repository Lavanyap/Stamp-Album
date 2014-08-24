class StampsController < ApplicationController
	before_action :authenticate_user!
	def new
		@a = params[:id]
		@country =Country.all
	end
	def show
		@stamps = Stamp.where(:album_id => params[:id])

	end


	def create
		@stamp = Stamp.new(stamp_params)
		
		if @stamp.save
			 flash[:notice] = "Stamp created"
			
			 redirect_to :controller=>'albums',:action=>'show',:id =>@stamp.album_id
			end

	end


	

	private
	def stamp_params
    params.require(:stamp).permit(:year_of_issue,:category_id,:country_id,:user_id,:album_id,:image)
  	end
end
