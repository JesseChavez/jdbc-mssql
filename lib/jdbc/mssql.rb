warn 'jdbc-mssql must be used with JRuby only' unless defined? JRUBY_VERSION

require 'jdbc/mssql/version'

module Jdbc
  module Mssql
    JAVA_VERSIONS = {
      '1.7' => 7,
      '1.8' => 8,
      '9'   => 9,
      '10'  => 10,
      '11'  => 11,
      '12'  => 12
    }.freeze

    JAVA_DRIVER_VERSIONS = {
      '1.7' => '6.4.0',
      '1.8' => '7.4.1',
      '9'   => '6.4.0',
      '10'  => '7.0.0',
      '11'  => '7.4.1',
      '12'  => '7.4.1'
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
