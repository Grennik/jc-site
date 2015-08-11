class PagesController < ApplicationController
	layout "application"
	def index
		@page = Page.all
	end
	
	
end
