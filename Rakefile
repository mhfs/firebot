$LOAD_PATH.unshift 'lib'

require 'bundler'
require "rspec/core/rake_task"

require "campfirer/tasks"

Bundler::GemHelper.install_tasks

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb"
end
