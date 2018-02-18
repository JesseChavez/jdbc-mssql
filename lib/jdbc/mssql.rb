require 'jdbc/mssql/version'

module Jdbc
  module Mssql
    # Your code goes here...
  end
end

if RUBY_PLATFORM =~ /java/
  require 'mssql-jdbc-6.2.2.jre8.jar'
elsif $VERBOSE
  warn 'jdbc-mssql must be used with JRuby only'
end
