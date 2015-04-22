Gem::Specification.new do |s|
  s.name              = "css_counter"
  s.version           = "0.2.0"
  s.summary           = "a (very) small library that counts selectors in a CSS file"
  s.description       = "a (very) small library that counts selectors in a CSS file"
  s.author            = "James Healy"
  s.email             = ["james@yob.id.au"]
  s.homepage          = "http://github.com/yob/css_counter"
  s.has_rdoc          = true
  s.rdoc_options      << "--title" << "CSS Counter" << "--line-numbers"
  s.test_files        = [ "spec/css_counter_spec.rb" ]
  s.files             = [ "lib/css_counter.rb", "lib/css_counter/railtie.rb", "lib/css_counter/css_counter.rake", "CHANGELOG","MIT-LICENSE", "README.rdoc" ]
  s.license           = "MIT"

  s.add_development_dependency("rake", "~> 10.0")
  s.add_development_dependency("rspec", "~>2.0")
  s.add_dependency("crass", "~>0.2")
end
