class View

  def ask_for(something)
    puts "What's the #{something}"
    gets.chomp
  end

  def display(recipes) # recipes are an array of recipe instances
    recipes.each_with_index do |recipe, index|
      x = recipe.done? ? "x" : ""
      puts "#{index + 1}- [#{x}] #{recipe.name} #{recipe.description} " #loop through them to extract name and description and display
    end
  end

end
