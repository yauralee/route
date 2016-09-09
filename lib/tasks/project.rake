namespace :project do
  task :run  do
    ProcessHandler.main('assets/routes.yml', 'assets/params.ymml')
  end
end