warn 'jdbc-mssql must be used with JRuby only' unless defined? JRUBY_VERSION

require 'jdbc/mssql/version'

module Jdbc
  module Mssql
    def self.jre_version
      version = ENV_JAVA['java.specification.version']

      return 7 if version == '1.7'

      return 8 if version == '1.8'

      nil
    end

    def self.jar_file
      "mssql-jdbc-#{DRIVER_VERSION}.jre#{jre_version}.jar"
    end

    def self.load_driver
      warn 'loading JDBC driver on require "jdbc/mssql"' if $VERBOSE

      raise 'No JDBC driver for your java version' if jre_version.nil?

      require jar_file
    end

    load_driver
  end
end
