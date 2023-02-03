RSpec.describe Jdbc::Mssql do
  java_versions = ['1.8'] + ('11'..'19').to_a

  it 'has a version number' do
    expect(Jdbc::Mssql::VERSION).not_to be nil
  end

  context '.jre_version' do
    it "should return current jre_version for java specification version #{ENV_JAVA['java.specification.version']}" do
      expect(ENV_JAVA['java.specification.version']).to include(Jdbc::Mssql.jre_version.to_s)
    end
  end

  context '.jar_file' do
    it 'should exist driver jar file' do
      jar_file = Jdbc::Mssql.jar_file

      expect(File.exist?("./lib/#{jar_file}")).to eq(true)
    end
  end

  context '.driver_version' do
    it 'should include major and minor from java Driver class' do
      driver = com.microsoft.sqlserver.jdbc.SQLServerDriver.new
      major = driver.get_major_version
      minor = driver.get_minor_version

      expect(Jdbc::Mssql.driver_version).to include("#{major}.#{minor}")
    end

    it 'should be included in driver version from java SQLServerDatabaseMetaData class' do
      meta_data = com.microsoft.sqlserver.jdbc.SQLServerDatabaseMetaData.new(nil)

      expect(meta_data.get_driver_version).to include(Jdbc::Mssql.driver_version)
    end
  end

  context '.load_driver' do
    it 'should not load driver when jre_version is 6' do
      allow(Jdbc::Mssql).to receive(:java_specification_version).and_return('1.6')

      expect { Jdbc::Mssql.load_driver }.to raise_error(RuntimeError)
    end

    it 'should not load driver when driver_version is 7' do
      allow(Jdbc::Mssql).to receive(:java_specification_version).and_return('1.7')

      expect { Jdbc::Mssql.load_driver }.to raise_error(RuntimeError)
    end

    java_versions.each do |java_version|
      it "should load driver when java version is #{java_version}" do
        allow(Jdbc::Mssql).to receive(:java_specification_version).and_return(java_version)

        expect { Jdbc::Mssql.load_driver }.not_to raise_error
      end
    end

    it 'should return false for current java specification version (driver is loaded)' do

      expect(Jdbc::Mssql.load_driver).to eq(false)
    end
  end

  # specs ends here
end
