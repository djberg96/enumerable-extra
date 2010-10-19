require 'rake'
require 'rake/testtask'

desc "Install the enumerable-extra library (non-gem)"
task :install do
  dest = File.join(Config::CONFIG['sitelibdir'], 'enumerable')
  Dir.mkdir(dest) unless File.exists? dest
  cp 'lib/enumerable/extra.rb', dest, :verbose => true
end

desc 'Build the enumerable-extra gem'
task :gem do
  spec = eval(IO.read('enumerable-extra.gemspec'))
  Gem::Builder.new(spec).build
end

desc "Install the enumerable-extra library as a gem"
task :install_gem => [:gem] do
  file = Dir["*.gem"].first
  sh "gem install #{file}"
end

Rake::TestTask.new do |t|
  t.warning = true
  t.verbose = true
end

task :default => :test
