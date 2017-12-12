class HomeController < ApplicationController
  def show
  	@pages = Page.where("featured=true") # we want to make sure that when the 
  	#featured is checked/selected it would be displayed in the home page else it wont 
  end
end
