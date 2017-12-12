class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :body
      t.string :position
      t.string :display
      t.boolean :show_title
      t.string :class_sufix
      t.boolean :is_published

      t.timestamps
    end
  end
end
