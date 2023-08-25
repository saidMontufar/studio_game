Gem::Specification.new do |s|
  s.name         = "studio_game"
  s.version      = "1.0.0"
  s.author       = "Said M"
  s.email        = "said.montufar@outlook.com"
  s.homepage     = "https://mytestore.ca"
  s.summary      = "NA"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end
