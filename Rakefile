require "bundler/gem_tasks"

require "rake/testtask"
Rake::TestTask.new(:spec) do |task|
  task.test_files = FileList['spec/**/*_spec.rb']
end

require "docu/rake/task"
Docu::Rake::Task.new do |task|
  task.file = "README.md.docu"
end
