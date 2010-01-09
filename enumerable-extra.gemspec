require 'rubygems'

Gem::Specification.new do |s|
  s.name      = 'enumerable-extra'
  s.version   = '0.1.2'
  s.license   = 'Artistic 2.0' 
  s.summary   = 'Enhanced methods for Enumerable objects'
  s.author    = 'Daniel Berger'
  s.email     = 'djberg96@gmail.com'
  s.homepage  = 'http://www.rubyforge.org/projects/shards'
  s.files     = Dir['**/*'].reject{ |f| f.include?('CVS') }
  s.test_file = 'test/test_enumerable_extra.rb'
  s.has_rdoc  = true

  s.rubyforge_project = 'shards'
  s.extra_rdoc_files  = ['README', 'CHANGES', 'MANIFEST']
  
  s.description = <<-EOF
     The enumerable-extra library provides overridden Enumerable methods
     that make it easier to handle common operations that apply to each
     element of a list without resorting to Symbol#to_proc. It also adds
     an Enumerable#sum method.
  EOF
end
