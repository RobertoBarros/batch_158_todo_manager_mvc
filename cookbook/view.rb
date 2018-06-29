class View

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}: #{recipe.name} | #{recipe.description}"
    end
  end

  def ask_recipe_name
    puts "What's the recipe name?"
    gets.chomp
  end

  def ask_recipe_description
    puts "What's the description?"
    gets.chomp
  end

  def ask_recipe_index
    puts "Index?"
    gets.chomp.to_i - 1
  end

end