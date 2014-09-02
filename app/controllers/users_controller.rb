class UsersController < ApplicationController
	def index
		@user =User.all.order(:name)
	end
	def edit
		@user =User.all.order(:name)
	end
	def new
		@user =User.all.order(:name)
	end

	def update_admin
		if (current_user.admin).to_s =="true"

			@user = User.find(params[:id])
		 	updated = @user.update(:admin =>true)
			if updated
			 	flash[:success] = "User role upgraded to Admin"
			
			 	redirect_to :controller=>'users',:action=>'index'
			
			else
				flash[:error] = "Some thing went wrong, user role didn't get updated to Admin !"
				redirect_to :controller=>'users',:action=>'index'
			end
		else
			flash[:error] = "You have to have admin privilages to accomplish this !"
		end

	end
	
end
