Gem::Specification.new do |s|
  s.name        = 'cloud-templates-graphviz'
  s.version     = '0.1.0'
  s.license     = 'Apache 2.0'
  s.summary     = 'GraphViz render for cloud-templates-ruby.'
  s.description = 'Generates visual representation for arbitrary model.'
  s.authors     = ['Ivan Matylitski', 'Ade Teriba']
  s.email       = ['buffovich@gmail.com', 'adekunleteriba@hotmail.com']
  s.files       = Dir['lib/**/*'] +
                  Dir['spec/**/*'] +
                  [
                    'LICENSE', 'Gemfile', 'NOTICE', 'README.md', 'Rakefile',
                    '.rubocop.yml', '.simplecov', 'cloud-templates.gemspec',
                    '.rspec'
                  ]
  s.test_files = Dir['spec/**/*']
  s.homepage    = 'https://rubygems.org/gems/cloud-templates-graphviz'
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0")
  s.add_dependency('cloud-templates', '>=0.4.0', '~> 0.4')
  s.add_dependency('gv', '>=0.1.0', '~> 0.1')
  s.add_development_dependency('rake', '>=12.3.0', '~>12.3')
  s.add_development_dependency('rspec', '>= 3.2', '~> 3')
  s.add_development_dependency('rubocop', '~> 0.50')
  s.add_development_dependency('rubocop-rspec', '~> 1.17')
  s.add_development_dependency('byebug', '>= 9.0.5', '~> 9')
  s.add_development_dependency('yard', '~> 0.9')
  s.add_development_dependency('simplecov', '~> 0.14')
end
