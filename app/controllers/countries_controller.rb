class CountriesController < ApplicationController


	before_action :authenticate_user!
	def index
		@country = Country.all.order(:name)

	end

	
	def new
		

	end
	def edit
	end
	def create
		@stamp = Country.new(country_params)
		
		if @stamp.save
			 flash[:notice] = "Country created"
			
			 redirect_to :controller=>'countries',:action=>'index'
			
		else
			flash[:error] = "Some thing went wrong, Country didn't get saved !"
			redirect_to :controller=>'countries',:action=>'index'
		end

	end

	def destroy
		if resource
			resource.destroy
			
			flash[:success] = "Country has been deleted"
    	else
    		flash[:error] = "Your attempt to delete the country was unsucessful"
		end
		
		redirect_to :controller=>'countries',:action =>'index'

	end
	private
	def country_params
		 params.require(:country).permit(:name)
	end
	def resource
    @resource ||= Country.where(:id => params[:id]).first
	end


end

