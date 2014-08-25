class RecipesController < ApplicationController
	before_filter :store_location

  def index
  	@recipes = Recipe.all

  	@published_and_featured = @recipes.published.featured.to_a
    @carousel = @published_and_featured.shift(5) if @published_and_featured
    @published_only = @recipes.published_only.limit(4)
  end

  def show
  	@recipes = Recipe.find(params[:id].to_s)

		respond_to do |format|
			format.html
      	format.json { render json: @recipes }
      	format.xml { render xml: @recipes }
    end
  end
end
