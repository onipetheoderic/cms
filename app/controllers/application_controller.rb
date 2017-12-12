class ApplicationController < ActionController::Base
	before_action :getPageNav, :getJumbotron, :getBlocks

  protect_from_forgery with: :exception
#We re trying to get pages from the db that are published and that has menu_display to be true, do we cant use Page.all
  def getPageNav #for this method to work we need to define it in the before_filter
  	@pageNav = Page.where("menu_display = true && is_published = true").order(order: :asc) #this is more like an sql query,
  end

  def getJumbotron
  	@jumbotron = Block.where("position = 'jumbotron'")#remembered we have different option for the positions
  end


  def getBlocks
  	@blocks = Block.where("position = 'block'").order(order: :asc)#we have the order field in the db
  end
end
#for the show method lets go to the pages controller