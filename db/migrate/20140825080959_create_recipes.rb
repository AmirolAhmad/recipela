class CreateRecipes < ActiveRecord::Migration
  def up
    unless table_exists? :recipes
      create_table :recipes do |t|
        t.text :title,              null: false
        t.text :description,        null: false

        t.integer :user_id,         null: false
        t.integer :category_id,     null: false
        t.integer :difficulty_id,   null: false
        t.string :slug,             null: false

        t.integer :prep_time,       null: false
        t.integer :serves,          null: false
        t.integer :cooking_time,    null: false
        t.text :ingredient,         null: false
        t.text :instruction,        null: false

        t.string :status #draft or published
        t.boolean :featured #exclusive from published
        t.string :slug,             null: false

        t.timestamps
        t.datetime :published_at
        t.datetime :deleted_at
      end

      create_table :friendly_id_slugs do |t|
        t.string   :slug,           :null => false
        t.integer  :sluggable_id,   :null => false
        t.string   :sluggable_type, :limit => 50
        t.string   :scope
        t.datetime :created_at
      end

      add_index :recipes, :slug
      add_index :recipes, :user_id
      add_index :recipes, :deleted_at
      
      add_index :friendly_id_slugs, :sluggable_id
      add_index :friendly_id_slugs, [:slug, :sluggable_type]
      add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], :unique => true
      add_index :friendly_id_slugs, :sluggable_type
    end
  end

  def down
    if table_exists? :recipes
      drop_table :recipes
      drop_table :friendly_id_slugs
    end
  end
end
