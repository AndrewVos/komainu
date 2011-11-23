require "bundler/gem_tasks"

require 'rake/testtask'
Rake::TestTask.new(:spec) do |task|
  task.test_files = FileList['spec/**/*_spec.rb']
end

task :execute_examples do
  execute_examples("README.md.docu")
end

def execute_examples(file)
  require "komainu"
  puts "Executing Examples..."
  errors = []
  contents = File.read(file)
  contents.scan(/:example:((?:(?!^:end:).)*)/m).flatten.each do |example|
    if example.include?("#=>")
      expected = example.scan(/#=>\s*(.*)/).first.first
      actual = eval(example).inspect
      if actual == expected
        print "."
      else
        print "F"
        errors << "Assertion does not match example. Expected \"#{actual}\" to equal \"#{expected}\"."
      end
    end
  end
  puts

  if errors.any?
    errors.each do |error|
      puts error
    end
    exit 1
  else
    puts "All examples passed!"
    File.open(file.chomp(File.extname(file)), "w") do |file|
      file.write contents.gsub(":example:\n", "").gsub(":end:\n", "")
    end
  end
end
