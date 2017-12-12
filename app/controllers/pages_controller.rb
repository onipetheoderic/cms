class PagesController < ApplicationController
  def show
  	@page = Page.find(params[:id]) #lets create a filter here to make sure that it only displays pages that are published
  	if @page.is_published == false
  		redirect_to root_path, alert:"This page does not exit"
  	end
  	@section = Section.all #this is to display all of the sections available to us

  end
end
