require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'rspec/core'
require 'rspec/core/rake_task'
require 'bundler/gem_helper'
Bundler::GemHelper.install_tasks

desc 'Default: run unit tests.'
task :default => :spec

desc 'Run the if_statement specs'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = './spec/**/*_spec.rb'
end

desc 'Generate documentation for the if_statement plugin.'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'IfStatement'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
