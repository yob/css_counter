class CssCounter
  class Railtie < Rails::Railtie
    railtie_name :css_counter

    rake_tasks do
      load "css_counter/css_counter.rake"
    end
  end
end
