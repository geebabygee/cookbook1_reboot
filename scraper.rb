require "open-uri"
require "nokogiri"
require_relative "recipe"

class Scraper
  def initialize(ingredient)
    @ingredient = ingredient # this comes from the user in the controller
  end

  def scrape

    html_file = open("http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{@ingredient}")
    doc = Nokogiri::HTML(html_file)

    results = []
    doc.search(".m_contenu_resultat").take(5).each do |recipe| #loop through the whole recipe div
      name = recipe.search(".m_titre_resultat").text.strip # within this loop search for the title and description
      description = recipe.search(".m_texte_resultat").text.strip[0..50]
      recipe = Recipe.new(name, description) # make recipe instance
      results << recipe
    end
    results
  end
end

