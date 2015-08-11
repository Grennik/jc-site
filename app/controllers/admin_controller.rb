class AdminController < ApplicationController
	protect_from_forgery with: :exception
	before_filter :authenticate_admin!
	
	
	def index
		@pages = Page.order('created_at DESC')
	end
		
	def new
		@pages = Page.new
	end
	
	def create
		@pages = Page.new(page_params)
		if @pages.save
		else
			render 'new'
		end
	end
	
	private
		def page_parms
			params.require(:pages).permit(:name, :description, :url, :image)
		end
	
	def destroy
  		sign_out
  		redirect_to root_path
	end
	
end
