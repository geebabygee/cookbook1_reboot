require_relative "view"
require_relative "recipe"
require_relative "scraper"

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

  def import
    # 1. ask user for ingredient to parse(view)
    ingredient = @view.ask_for("ingredient to search for, please")
    # 2. instantiate a new Scraper object and call its scrape method
    recipes = Scraper.new(ingredient).scrape # array of instances
    # 3. show list to user (view)
    @view.display(recipes)
    # 4. choose the number of recipe to import(view)
    index = @view.ask_for("number of recipe to import, please").to_i - 1
    # 5. find recipe in the list
    recipe = recipes[index]
    # 6. give to cookbook to store (cookbook)
    @cookbook.add(recipe)
  end

  def mark_as_done
    # 1. list
    list
    # 2. ask user for number to mark as tested
    index = @view.ask_for("number of recipe to mark as tested, please").to_i - 1
    # 3. call the mark as done method in the cookbook
    @cookbook.mark_as_done(index)
  end





end
