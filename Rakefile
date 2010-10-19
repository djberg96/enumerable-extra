require 'rake'
require 'rake/testtask'

desc "Remove any gem or rbc (Rubinius) files"
task :clean do
  Dir['*.gem'].each{ |f| File.delete(f) }
  Dir['**/*.rbc'].each{ |f| File.delete(f) }
end

desc "Install the enumerable-extra library (non-gem)"
task :install do
  dest = File.join(Config::CONFIG['sitelibdir'], 'enumerable')
  Dir.mkdir(dest) unless File.exists? dest
  cp 'lib/enumerable/extra.rb', dest, :verbose => true
end

namespace :gem do
  desc 'Build the enumerable-extra gem'
  task :create => [:clean] do
    spec = eval(IO.read('enumerable-extra.gemspec'))
    Gem::Builder.new(spec).build
  end

  desc "Install the enumerable-extra library as a gem"
  task :install => [:create] do
    file = Dir["*.gem"].first
    sh "gem install #{file}"
  end
end

Rake::TestTask.new do |t|
  t.warning = true
  t.verbose = true
end

task :default => :test
