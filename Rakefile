# set rspec spec as default rake task
# can type rake in command line to run the test

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
  puts 'rspec not available'
end


