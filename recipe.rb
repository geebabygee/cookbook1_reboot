class Recipe # Model
  attr_reader :name, :description, :done

  def initialize(name, description)
    @name = name # String
    @description = description # String
    @done = false # Boolean
  end

  def done?
    @done
  end

  # Customised writer
  def mark_as_done! # Model is responsible to change its own state
    @done = true
  end

end
