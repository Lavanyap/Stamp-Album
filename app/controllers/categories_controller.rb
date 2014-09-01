class CategoriesController < ApplicationController

	before_action :authenticate_user!
	def index
		@category = Category.all.order(:name)

	end

	
	def new
	

	end
	def edit
	end
	def create
		@category = Category.new(category_params)
		
		if @category.save
			 flash[:success] = "Category created"
			
			 redirect_to :controller=>'categories',:action=>'index'
			
		else
			flash[:error] = "Some thing went wrong, Category didn't get saved !"
			redirect_to :controller=>'categories',:action=>'index'
		end

	end

	def destroy
		if resource
			resource.destroy
			
			flash[:success] = "Category has been deleted"
    	else
    		flash[:error] = "Your attempt to delete the category was unsucessful"
		end
		
		redirect_to :controller=>'categories',:action =>'index'

	end
	private
	def category_params
		 params.require(:category).permit(:name)
	end
	def resource
    @resource ||= Category.where(:id => params[:id]).first
	end



end
