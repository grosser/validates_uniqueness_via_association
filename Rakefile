require "bundler/setup"
require "bundler/gem_tasks"
require "rake/testtask"
require "bump/tasks"

Rake::TestTask.new :default do |t|
  t.pattern = 'test/**/*_test.rb'
  t.warning = true
end
