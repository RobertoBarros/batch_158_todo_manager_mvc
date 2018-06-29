require 'csv'

class Cookbook
  def initialize(file_path)
    @file_path = file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@file_path) do |row|
      name = row[0]
      description = row[1]
      @recipes << Recipe.new(name, description)
    end
  end

  def save_csv
    CSV.open(@file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        name = recipe.name
        description = recipe.description
        csv << [name, description]
      end

    end

  end

end