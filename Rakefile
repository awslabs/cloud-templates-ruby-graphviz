require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
require 'yard'

desc 'Generate documentation'
YARD::Rake::YardocTask.new(:doc) do |t|
  t.files   = ['lib/**/*.rb']
end

desc 'Check code notation'
RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'spec/**/*.rb']
  task.formatters += ['html']
  task.options += [
    '--fail-level', 'convention',
    '--out', 'rubocop.html'
  ]
end

desc 'Run unit tests'
RSpec::Core::RakeTask.new(:test) do |task|
  task.pattern = '{spec/}**{,/*/**}/*_spec.rb'
end

task default: [:test, :lint, :doc]
