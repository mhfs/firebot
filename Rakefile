$LOAD_PATH.unshift 'lib'

require "bundler"
require "rspec/core/rake_task"

require "firebot/tasks"

Bundler::GemHelper.install_tasks

task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb"
end
