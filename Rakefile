require "rake/testtask"
require_relative "lib/rubyapp/init"
Rake::TestTask.new do |t|
	t.libs << "test"
	t.test_files = FileList["test/test_*.rb"]
end

desc "Load in IRB"
task :console do
	exec "irb -Ilib -rrubyapp"
end

task :default => :test