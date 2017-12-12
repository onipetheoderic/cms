ActiveAdmin.register Page do
	# To prevent this error: ActiveModel::ForbiddenAttributesError in Admin::PagesController#create 
	# To allow it to save to the database

	permit_params :title, :body, :order, :is_published, :menu_display, :section_id, :featured
	#the section connecting the two dbs together should not be included here
	#instead we use section_id instead of section
	#This is to allow the fields listed to be saved to the db
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
#WE notice that displaying the body of the page in the admin view, would display stupidly, when text is too long, 
#So lets display the necessary things without the body
index do
	column :id
	column :title, :sortable => :title #to make it arrange according to its title, 
	column :section, :sortable => :section
	column :created_at, :sortable => :created_at
	column :order
	column :is_published
	actions #this is to display the view edit and delete actions
end



#This form was created to change the ordering of the form fields so that we can order it ourselves

form do |f|
	f.inputs "Details" do
		f.input "title", :label => "Title"
		f.input "section", :label => "Section"
		f.input "body", as: :html_editor, :label => "Body"
		f.input "order", :label => "Order"
		f.input "is_published", :label => "Published" #boolean values are mostly represented as checkboxes
		f.input "featured", :label => "Featured" #boolean values are mostly represented as checkboxes
		f.input "menu_display", :label => "Display"
		f.actions #it has to be there, this takes care of displaying the buttons to the screeen
	end
end

end
