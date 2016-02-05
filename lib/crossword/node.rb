module Crossword

  class Node
    attr_reader :x, :y, :components

    def initialize(x,y)
      @x = x
      @y = y
      @value = nil
    end

    def add_component(component, value)
      @components ||= {}
      @components[component] = value
    end

  end

end