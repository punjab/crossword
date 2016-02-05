module Crossword

  class Grid
    attr_reader :legend, :grid

    def initialize(size, layout_file, across_file, down_file)
      @grid = []
      @legend = {}
      scan_layout(layout_file)
      scan_across(across_file)
      scan_down(down_file)
    end

    def to_s
      result = ""
      @grid.each do |row|
        row.each do |node|
          result << node.components[:ref_char]
        end
        result << "\n"
      end
      result
    end

    private

    def scan_layout(layout_file)
      lines = File.readlines(layout_file)
      lines.each_with_index do |line, row|
        line.scan(/\S/).each_with_index do |character, column|
          @grid[row] ||= []
          @grid[row][column] = Node.new(row, column)
          @grid[row][column].add_component(:ref_char, character)
          @legend[character] = @grid[row][column] if character.match(/[A-H1-9]/)
        end
      end
    end

    def scan_across(across_file)
      scan_file(across_file, :across)
    end

    def scan_down(down_file)
      scan_file(down_file, :down)
    end

    def scan_file(file, direction)
      hints = File.readlines(file)
      hints.each do |hint|
        ref_id = hint[0]
        @legend[ref_id].add_component(direction, hint[3..-2])
      end
    end
  end

end