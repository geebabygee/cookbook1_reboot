class Recipe # Model
  attr_reader :name, :description

  def initialize(name, description)
    @name = name # String
    @description = description # String
  end

end
