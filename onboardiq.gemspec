lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name          = "onboardiq"
  s.version       = "0.1.0"
  s.date          = "2014-10-15"
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Jeff Wells, Keith Ryu"]
  s.email         = ["jeff@jeffrwells.com, keith@onboardiq.com"]
  s.homepage      = "http://github.com/kibaekr/onboardiq"
  s.summary       = "A ruby wrapper for OnboardIQ's API."
  s.description   = "This is a simple way to use OnboardIQ's API with a Ruby on Rails app."
  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib', 'spec']
  s.license       = 'MIT'
  s.add_runtime_dependency "httparty"
end