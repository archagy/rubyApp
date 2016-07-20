require "rake/testtask"
require_relative "lib/rubyapp/init"
Rake::TestTask.new do |t|
	t.libs << "test"
	t.test_files = FileList["test/test_*.rb"]
end
task :default => :test