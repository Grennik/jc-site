class AdminController < ApplicationController
	protect_from_forgery with: :exception
	before_filter :authenticate_admin!
	
	
	def index
		@page = Page.order('created_at DESC')
	end
		
	def new
		@page = Page.new
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
