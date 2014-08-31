class SharesController < ApplicationController
	before_action :authenticate_user!
	def index
		@user =User.where.not(:id => current_user.id)
		@album = params[:id]
	end

	
	def albums_shared_by_user

		
		
		@share = Share.all.where(:user_id => current_user.id)

	end
	def albums_shared_to_user
		
		@share = Share.all.where(:shared_to => current_user.id)

	end


	def create
		# check if the the album is already shared to current user
			@already_shared =[]
			a =share_params[:album_id]
			b =share_params[:shared_to]
			@already_shared = Share.where(:album_id => a, :shared_to => b)
  			if @already_shared.empty?
			
			# if not share
			@share = Share.new(share_params)
		
			if @share.save
				 flash[:notice] = "album shared"
			
				 redirect_to :controller=>'shares',:action=>'albums_shared_by_user'
				end
			else

			flash[:error] = "You have already shared the album with this user"
				redirect_to :controller=>'shares',:action=>'albums_shared_by_user'
		end
		
	

	end

	def destroy
		if resource
			resource.destroy
			flash[:success] = "Album has been unshared"
			redirect_to :controller=>'shares',:action =>'albums_shared_by_user'
		else
			flash[:error] = "Your attempt unshare was unsucessful"
			redirect_to :controller=>'shares',:action =>'albums_shared_by_user'
		end

	end


	private
	def share_params
    	params.require(:share).permit(:user_id,:shared_to,:album_id)
  	end
  	def resource
    @resource ||= current_user.shares.where(:id => params[:id]).first
  	end
  

end
