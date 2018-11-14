warn 'jdbc-mssql must be used with JRuby only' unless defined? JRUBY_VERSION

require 'jdbc/mssql/version'

module Jdbc
  module Mssql
    def self.jre_version
      version = ENV_JAVA['java.specification.version']

      return 7 if version == '1.7'

      return 8 if version == '1.8'

      return 9 if version == '9'

      nil
    end

    def self.driver_version(version)
      return '6.4.0' if version == 7

      return '7.0.0' if version == 8

      return '6.4.0' if version == 9

      return '7.0.0' if version == 10

      nil
    end

    def self.jar_file
      "mssql-jdbc-#{driver_version(jre_version)}.jre#{jre_version}.jar"
    end

    def self.load_driver
      warn 'loading JDBC driver on require "jdbc/mssql"' if $VERBOSE

      if jre_version.nil? || driver_version.nil?
        raise 'No JDBC driver for your java version'
      end

      require jar_file
    end

    load_driver
  end
end
