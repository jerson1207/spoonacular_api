class RecipesController < ApplicationController
  def search
    @recipes = SpoonacularService.search_recipes(params[:query])
  end
end
