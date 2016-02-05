# Crossword

A crossword attempt in Ruby

```ruby
# create a new grid
grid = Crossword::Grid.new(9, 'data/layout.txt', 'data/across.txt', 'data/down.txt')

# Print the ascii form of the data structure
puts grid

# A lookup hash for O(1) search for words on the grid
pp grid.legend

# Add a component to a node. Any arbitrary number of components can be added to a node.

node = grid[0,5]
node.add_component(:down, 'Name of a bird')
