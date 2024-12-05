warn 'jdbc-mssql must be used with JRuby only' unless defined? JRUBY_VERSION

require 'jdbc/mssql/version'

module Jdbc
  module Mssql
    def self.java_specification_version
      ENV_JAVA['java.specification.version']
    end

    def self.jre_version
      java_specification_version.split('.').last.to_i
    end

    def self.driver_version
      '12.6.4'
    end

    def self.effective_jre_version
      if jre_version >= 11
        11
      elsif jre_version == 8
        8
      end
    end

    def self.jar_file
      "mssql-jdbc-#{driver_version}.jre#{effective_jre_version}.jar"
    end

    def self.load_driver
      warn 'loading JDBC driver on require "jdbc/mssql"' if $VERBOSE

      raise 'No JDBC driver for your java version' unless jre_version > 7

      require jar_file
    end

    load_driver
  end
end
