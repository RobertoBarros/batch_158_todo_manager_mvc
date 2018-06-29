require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_all_recipes
  end

  def create
    # ask recipe name
    name = @view.ask_recipe_name
    # ask recipe description
    description = @view.ask_recipe_description
    # Instanciate a new recipe
    recipe = Recipe.new(name, description)
    # Add the recipe to cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # list all recipe
    display_all_recipes
    # ask recipe index
    index = @view.ask_recipe_index
    # cookbook remove recipe
    @cookbook.remove_recipe(index)
  end

  private

  def display_all_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end

end