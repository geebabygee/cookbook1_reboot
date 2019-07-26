require_relative "recipe"
require_relative "cookbook"

# Here is where I can test my MODEL and REPOSITORY before I have a Controller.
# Once I have a controller I can use the app.rb and run the program to test

recipe1 = Recipe.new("Feijoada", "beans meat and rice")
recipe2 = Recipe.new("Bitoque", "steak eggs and chips")
p recipe1

cookbook = Cookbook.new("recipes.csv")

cookbook.add(recipe1)
cookbook.add(recipe2)

p cookbook
