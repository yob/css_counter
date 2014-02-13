require 'crass'

class CssCounter

  def self.count(input)
    self.new.count(input)
  end

  def count(input)
    tree = Crass.parse(input)
    selector_count = tree.select { |item|
      item[:node] == :style_rule
    }.size
  end
end
