
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jdbc/mssql/version'

Gem::Specification.new do |spec|
  spec.name          = 'jdbc-mssql'
  spec.version       = Jdbc::Mssql::VERSION
  spec.authors       = ['Jesse Chavez']
  spec.email         = ['jesse.chavez.r@gmail.com']

  spec.summary       = %q{JDBC driver for JRuby and SQL Server / Azure SQL}
  spec.description   = %q{Loads the Microsoft SQL Server JDBC driver. Install this gem and require 'jdbc/mssql' within JRuby}
  spec.homepage      = 'https://github.com/JesseChavez/jdbc-mssql'
  spec.license       = 'MIT'
  spec.platform      = 'java'

  spec.files         = ['README.md', 'LICENSE.txt', *Dir['lib/**/*'].to_a ]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
