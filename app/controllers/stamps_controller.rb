class StampsController < ApplicationController
	before_action :authenticate_user!
	def index
		@id = (params[:id].to_i)
		@country =Country.all.order(:name)
		@category =Category.all.order(:name)

	end

	def new
		@a = params[:id]
		@country =Country.all.order(:name)
		@category =Category.all.order(:name)
	end
	def show
		@id = params[:id]
		@stamp = current_user.stamps.where(:country_id => params[:country_id])
		

	end

	def index_by_country
		
		@stamp = current_user.stamps.where(:country_id => params[:country_id])	

	end
	def index_by_category
		
		@stamp = current_user.stamps.where(:category_id => params[:category_id])	

	end


	def create
		@stamp = Stamp.new(stamp_params)
		
		if @stamp.save
			 flash[:notice] = "Stamp created"
			
			 redirect_to :controller=>'albums',:action=>'show',:id =>@stamp.album_id
			
		else
			flash[:error] = "Some thing went wrong, Stamp didn't get saved !"
			redirect_to :controller=>'albums',:action=>'show',:id =>@stamp.album_id
		end

	end

	def destroy
		if resource
			resource.destroy

			flash[:success] = "Stamp has been deleted"
			redirect_to :controller=>'albums',:action =>'index'
		else
			flash[:error] = "Your attempt to delete the stamp was unsucessful !"
		
			redirect_to :controller=>'albums',:action =>'index'
		end
	end

	def edit

		@stamp = Stamp.find(params[:id])
		if @stamp
			flash[:notice] = "Stamp exists"
			@a = @stamp.album_id
			@country =Country.all.order(:name)
			@category =Category.all.order(:name)
		else
			flash[:error] = "Something went wrong stamp doesn't exist !"
			redirect_to :controller=>'albums',:action=>'index'
		end

	end
	def update
		@stamp = Stamp.find(params[:id])
		@stamp.update(stamp_params)
		if @stamp
			 flash[:success] = "Stamp updated"
			
			 redirect_to :controller=>'albums',:action=>'show',:id =>@stamp.album_id
			
		else
			flash[:error] = "Some thing went wrong, Stamp didn't get updated !"
			redirect_to :controller=>'albums',:action=>'index'
		end
	end





	

	private
	def stamp_params
    params.require(:stamp).permit(:year_of_issue,:category_id,:country_id,:user_id,:album_id,:image,:face_value,:number_of_stamps_issued,:number_of_stamps_in_collection)
  	end
   def resource
    @resource ||= current_user.stamps.where(:id => params[:id]).first
  end

end
