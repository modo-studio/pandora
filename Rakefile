require "bundler/gem_tasks"
require 'rake/testtask'

desc 'Execute pandora tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

desc 'Default: Execute tests'
task default: :test
