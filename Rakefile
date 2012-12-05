begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

task 'tests' do
  ['rspec', 'rake jasmine:ci'].each do |task_name|
    puts "Starting to run #{task_name}..."
    system("bundle exec #{task_name}")
    raise "#{task_name} failed!" unless $?.exitstatus == 0
  end
end
