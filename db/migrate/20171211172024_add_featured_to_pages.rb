class AddFeaturedToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :featured, :boolean
  end
end
