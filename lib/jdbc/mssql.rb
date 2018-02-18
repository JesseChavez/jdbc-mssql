warn 'jdbc-mssql must be used with JRuby only' unless defined? JRUBY_VERSION

require 'jdbc/mssql/version'

module Jdbc
  module Mssql

    def self.jar_file
      'mssql-jdbc-6.2.2.jre8.jar'
    end

    def self.load_driver
      warn 'loading JDBC driver on require "jdbc/mssql"' if $VERBOSE
      require jar_file
    end

    load_driver
  end
end
