class StampsController < ApplicationController
	before_action :authenticate_user!
	def index
		@country =Country.all.order(:name)
	end

	def new
		@a = params[:id]
		@country =Country.all.order(:name)
		@category =Category.all.order(:name)
	end
	def show
		@id = params[:id]
		@stamp = current_user.stamps.where(:country_id => params[:id])
		

	end


	def create
		@stamp = Stamp.new(stamp_params)
		
		if @stamp.save
			 flash[:notice] = "Stamp created"
			
			 redirect_to :controller=>'albums',:action=>'show',:id =>@stamp.album_id
			end

	end

	def destroy
		
			resource.destroy
		
		
		redirect_to :controller=>'albums',:action =>'index'
	end



	

	private
	def stamp_params
    params.require(:stamp).permit(:year_of_issue,:category_id,:country_id,:user_id,:album_id,:image,:face_value,:number_of_stamps_issued,:number_of_stamps_in_collection)
  	end
   def resource
    @resource ||= current_user.stamps.where(:id => params[:id]).first
  end
end
