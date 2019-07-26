require_relative "view"
require_relative "recipe"

class Controller

  def initialize(cookbook)
    @cookbook = cookbook # this will be passed in when we create the Controller object (check app.rb)
    @view = View.new
  end

  # User Actions - create, list, destroy
  def create
    #1. Ask user for name + description(View)
    name = @view.ask_for("name of recipe, please")
    description = @view.ask_for("description of recipe, please")
    #2. Make a recipe instance with the info (Model)
    recipe = Recipe.new(name,description)
    #3. Send to repo to store(repo)
    @cookbook.add(recipe)
  end

  def list
    #1. Get recipes from cookbook(repo)
    recipes = @cookbook.all
    #2. Send to view to display(view)
    @view.display(recipes)
  end

  def destroy
    #1. list
    list
    #2. Ask user for number(view)
    index = @view.ask_for("number of recipe to delete, please").to_i - 1
    #3. Remove from repo(repo)
    @cookbook.remove(index)
  end



end
