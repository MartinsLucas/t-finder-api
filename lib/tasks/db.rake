namespace :db do
  task :exists do
    # Tries to initialize the application.
    # It will fail if the database does not exist
    Rake::Task["environment"].invoke
    ActiveRecord::Base.connection
    puts "Database successfully connected!"
  rescue StandardError
    puts "Can't connect database!"
    exit 1
  else
    exit 0
  end
end
