require 'rubygems'
require 'rake'

task :default=> "spec:popup"

namespace :spec do
  #~ require 'rspec/core/rake_task'
  #~ RSpec::Core::RakeTask.new(:spec)
  
  desc "Run specs against ie adapter"
  task "popup" do
    #task = Rake::Task["spec:spec"]
    #task.reenable
    #task.invoke
    Dir.chdir(File.dirname(__FILE__)) do
      puts `rspec`
    end
  end
end