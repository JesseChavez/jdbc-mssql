warn 'jdbc-mssql must be used with JRuby only' unless defined? JRUBY_VERSION

require 'jdbc/mssql/version'

module Jdbc
  module Mssql
    JAVA_VERSIONS = {
      '1.8' => 8,
      '11' => 11,
      '14' => 14
    }.freeze

    JAVA_DRIVER_VERSIONS = {
      '1.8' => '8.4.1',
      '11' => '8.4.1',
      '14' => '8.4.1'
    }.freeze

    def self.java_specification_version
      ENV_JAVA['java.specification.version']
    end

    def self.jre_version
      JAVA_VERSIONS[java_specification_version]
    end

    def self.driver_version
      JAVA_DRIVER_VERSIONS[java_specification_version]
    end

    def self.jar_file
      "mssql-jdbc-#{driver_version}.jre#{jre_version}.jar"
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
