IE_SELECTOR_LIMIT = 4095

namespace :css_counter do
  task default: :check_selectors

  desc "Ensure no compiled CSS file has more than 4095 selectors"
  task check_selectors: [:environment] do
    sprockets = Rails.application.assets

    css_paths = %w{application.css}
    css_paths += Rails.application.config.assets.precompile.select { |item|
      item.is_a?(String) && item[-4,4] == ".css"
    }
    css_paths.each do |path|
      css = sprockets[path].body
      selector_count = CssCounter.new(css).selectors
      if selector_count > IE_SELECTOR_LIMIT
        $stderr.puts "#{path} has #{selector_count} CSS selectors, must not exceed #{IE_SELECTOR_LIMIT}"
        exit(1)
      end
    end
  end
end
