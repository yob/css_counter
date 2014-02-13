require 'crass'
require 'ir_b'

class CssCounter

  def self.count(input)
    self.new.count(input)
  end

  def count(input)
    tree = Crass.parse(input)
    selector_count = tree.select { |item|
      item[:node] == :style_rule
    }.map { |item|
      item[:selector][:value].split(",")
    }.flatten.size
    media_queries = tree.select { |item|
      item[:node] == :at_rule && item[:name] == "media"
    }
    media_queries.each do |mq|
      selector_count += count_selectors_in_mq(input, mq)
    end
    selector_count
  end

  private

  def count_selectors_in_mq(css, mq)
    startpos = mq[:block][:tokens][1][:pos]
    endpos   = mq[:block][:tokens][-2][:pos]
    local_css = css[startpos, endpos-startpos]
    count(local_css)
  end

end
