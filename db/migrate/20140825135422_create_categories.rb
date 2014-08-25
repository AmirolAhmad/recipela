class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
    	t.string :name, null: false, limit: 50
    end unless table_exists? :categories
  end

  def down
    drop_table :categories if table_exists? :categories
  end
end
