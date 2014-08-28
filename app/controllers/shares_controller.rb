class SharesController < ApplicationController
	def index
		@user =User.all
		@album = params[:id]
	end

	def show	
	
		@a =(params[:id].to_i)
		
		params[:id] = current_user.id
		@share = Share.all.where(:user_id =>params[:id])

		@share1 = Share.all.where(:shared_to =>params[:id])
	
	
	end



	def create
		@share = Share.new(share_params)
		
		if @share.save
			 flash[:notice] = "album shared"
			
			 redirect_to :controller=>'albums',:action=>'index'
			end
		end


	private
	def share_params
    	params.require(:share).permit(:user_id,:shared_to,:album_id)
  	end

end
