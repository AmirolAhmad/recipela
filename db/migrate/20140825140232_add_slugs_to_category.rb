class AddSlugsToCategory < ActiveRecord::Migration
  def up
  	add_column :categories, :slug, :string unless column_exists? :categories, :slug
    Category.all.each{ |c|  c.update_attribute(:slug, c.name.to_url)}
  end

  def down
    remove_column :categories, :slug if column_exists? :categories, :slug
  end
end
