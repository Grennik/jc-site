class AdminController < ApplicationController
	before_filter :authenticate_admin!
	
	
	def index
		@page = Page.new
		@pages = Page.all
	end
		
	def new
		@page = Page.new
	end
	
	def show
		@page = Page.find(params[:id])
	end
	
	def create
		page = Page.create page_params
		if page.persisted?
			redirect_to action: :index
		else
			render 'new'
		end
	end
	
	private
		def page_params
			params.require(:page).permit(:name, :description, :url, :image)
		end
	
	def destroy
  		sign_out
  		redirect_to root_path
	end
	
end
