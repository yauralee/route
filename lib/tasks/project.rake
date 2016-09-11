namespace :project do
  desc 'run project to output results'
  task :run => 'test' do
    puts 'RESULTS: '
    ProcessHandler.process('resource/route.yml', 'resource/calculation_requirement_and_condition.yml')
  end
end

