class AdminController < ApplicationController
	before_filter :authenticate_admin!
	
	
	def index
		@page = Page.all
	end
		
	def new
		@page = Page.new
	end
	
	def show
		@page = Page.find(params[:id])
	end
	
	def create
		@page = Page.new(page_params)
		if @page.save
		else
			render 'new'
		end
	end
	
	private
		def page_parms
			params.require(:page).permit(:name, :description, :url, :image)
		end
	
	def destroy
  		sign_out
  		redirect_to root_path
	end
	
end
