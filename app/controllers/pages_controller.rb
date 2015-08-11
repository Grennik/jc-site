class PagesController < ApplicationController
	layout "application"
	def index
		@pages = Page.all
	end
	
	
end
