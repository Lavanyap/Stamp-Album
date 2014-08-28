class SharesController < ApplicationController
	def index
		@user =User.all
		@album = params[:id]
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
