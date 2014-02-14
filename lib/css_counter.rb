require 'crass'
require 'css_counter/railtie' if defined?(Rails)

class CssCounter

  def initialize(css)
    @css = css
  end

  def selectors
    @selectors ||= count_selectors_in_css_string(@css)
  end

  private

  def count_selectors_in_css_string(string)
    tree = Crass.parse(string)
    tree.map { |item|
      count_selectors_in_node(item)
    }.inject(0) { |accum, i|
      accum += i
    }
  end

  def count_selectors_in_node(item)
    case item[:node]
    when :style_rule then count_selectors_in_style_rule(item)
    when :at_rule    then count_selectors_in_at_rule(item)
    else
      0
    end
  end

  def count_selectors_in_style_rule(item)
    item[:selector][:value].split(",").size
  end

  def count_selectors_in_at_rule(item)
    if item[:name] == "media"
      startpos = item[:block][:tokens][1][:pos]
      endpos   = item[:block][:tokens][-2][:pos]
      local_css = @css[startpos, endpos-startpos]
      count_selectors_in_css_string(local_css) + 1
    elsif item[:name] == "font-face"
      1
    elsif item[:name] =~ /keyframes\Z/
      item[:block][:value].select { |item| item[:node] == :percentage }.size
    else
      0
    end
  end

end
