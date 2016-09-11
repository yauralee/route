require './lib/process_handler.rb'
Dir.glob('lib/tasks/*.rake').each { |task| load task }
# File.expand_path('Gemfile', __FILE__)
# require 'bundler/setup' # Set up gems listed in the Gemfile.


begin
  require 'rspec/core/rake_task'
  puts 'RUN TESTS:'
  RSpec::Core::RakeTask.new(:spec)
  task :test => :spec
rescue LoadError => error
  puts error.message
end
