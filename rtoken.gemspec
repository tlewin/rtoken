Gem::Specification.new do |s|
  s.name        = 'rtoken'
  s.platform    = Gem::Platform::RUBY
  s.version     = '0.2.1'
  s.date        = '2012-03-02'
  s.summary     = 'Simple Random Token Generator'
  s.description = 'RToken generates random tokens, of any length, for multiple purposes, ex: web urls, data identification, etc.'
  s.authors     = ['Thiago Lewin']
  s.email       = 'thiago_lewin@yahoo.com.br'
  s.files       = ['lib/rtoken.rb', 'bin/rtoken', 'README.rdoc', 'LICENSE']
  s.homepage    = 'https://github.com/tlewin/rtoken'
  s.bindir      = 'bin'
  s.executables << 'rtoken'

  s.add_dependency 'clipboard'

  s.licenses      = ['MIT']
end