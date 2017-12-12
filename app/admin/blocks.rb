ActiveAdmin.register Block do

permit_params :title, :body, :position, :display, :show_title, :class_sufix, :is_published, :order
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

#The display is ugly because of the huge amount of texts displayed by the body
index do
	column :id
	column :title, :sortable => :title #to make it arrange according to its title, 
	column :position, :sortable => :position
	column :display, :sortable => :display
	column :created_at, :sortable => :created_at
	column :order
	actions #this is to display the view edit and delete actions
end

form do |f|
	f.inputs "Details" do
		f.input "title", :label => "Title"
		f.input "show_title", :label => "Show the title"
		f.input "body", as: :html_editor, :label => "Body"
		f.input "position", :label => "Position", :as => :select, :collection => [["Jumbotron", "jumbotron"], ["Block", "block"]]
		#the reason we write the position this way, is because we want it to have a select option of jumbotron
		#Jumbotron the the action itself, while "jumbotron" is the name we want to see
		#so it would only have two options now --> jumbotron or block
		f.input "display", :label => "Display", :as => :select, :collection => [["All pages", "all"], ["Homepage only", "home"],["All but Homepage", "nohome"]]
		f.input "order", :label => "Order" #we forgot to put the order field here so lets run some migrations
		f.input "class_sufix", :label => "Class Sufix"
		f.input "is_published", :label => "Published" #boolean values are mostly represented as checkboxes
		f.actions #it has to be there, this takes care of displaying the buttons to the screeen
	end
end

end
