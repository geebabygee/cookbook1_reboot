require "csv"
require "byebug"

class Cookbook # Repository class - responsible for adding, deleting and storing data.
  def initialize(csv_path) # csv file is passed in when we create the cookbook instance (check app.rb)
    @csv_path = csv_path
    @recipes = [] # array of recipe instances
    load_csv # called only once, when we run app.rb and we want to bring our objects to life from the csv
  end

  def add(recipe)
    @recipes << recipe
    save_to_csv #changing data so save!
  end

  def remove(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_csv #changing data so save!
  end

  # def find(index)
  #   @recipes[index]
  # end

  def all
    @recipes
  end

  def mark_as_done(index) # we define this method here so we can save it!
    recipe = @recipes[index]
    recipe.mark_as_done!
    save_to_csv
  end

  private
  # Ruby recipe instances --> csv "..."
  def save_to_csv
    CSV.open(@csv_path, "wb") do |row|
      @recipes.each do |recipe| # Loop through our recipes objects array  and for each recipe object extract the name and description to add to the csv
        row << [recipe.name, recipe.description, recipe.done]
      end
    end
  end

  # CSV ----> Ruby recipe instances
  def load_csv
    CSV.foreach(@csv_path) do |row|
      # row looks like ["bitoque", "steak egg and chips"]
      name = row[0] # "bitoque"
      description = row[1]
      recipe = Recipe.new(name, description) # make a new instance
      # row looks like ["bitoque", "steak egg and chips", "true"]
      recipe.mark_as_done! if row[2] == "true" # only STRINGS are saved in the csv so to change the string to the boolean we need to convert it here.
      @recipes << recipe # add it to the array of instances
    end
  end






end
