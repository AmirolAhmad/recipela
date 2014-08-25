class AddSlugsToDifficulty < ActiveRecord::Migration
	def up
  	add_column :difficulties, :slug, :string unless column_exists? :difficulties, :slug
    Difficulty.all.each{ |c|  c.update_attribute(:slug, c.name.to_url)}
  end

  def down
    remove_column :difficulties, :slug if column_exists? :difficulties, :slug
  end
end
