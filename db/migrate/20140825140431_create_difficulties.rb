class CreateDifficulties < ActiveRecord::Migration
	def up
    create_table :difficulties do |t|
    	t.string :name, null: false, limit: 50
    end unless table_exists? :difficulties
  end

  def down
    drop_table :difficulties if table_exists? :difficulties
  end
end
