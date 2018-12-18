RSpec.describe Jdbc::Mssql do
  it 'has a version number' do
    expect(Jdbc::Mssql::VERSION).not_to be nil
  end

  context '.jre_version' do
    Jdbc::Mssql::JAVA_VERSIONS.each do |version_spec, version_value|
      it "should return #{version_value} when java specification version is '#{version_spec}'" do
        allow(Jdbc::Mssql).to receive(:java_specification_version).and_return(version_spec)

        expect(Jdbc::Mssql.jre_version).to eq(version_value)
      end
    end
  end

  context '.driver_version' do
    Jdbc::Mssql::JAVA_DRIVER_VERSIONS.each do |java, driver|
      it "should return '#{driver}' when java specification version is '#{java}'" do
        allow(Jdbc::Mssql).to receive(:java_specification_version).and_return(java)

        expect(Jdbc::Mssql.driver_version).to eq(driver)
      end
    end
  end

  context '.load_driver' do
    it 'should not load driver when jre_version is nil' do
      allow(Jdbc::Mssql).to receive(:jre_version).and_return(nil)

      expect { Jdbc::Mssql.load_driver }.to raise_error(RuntimeError)
    end

    it 'should not load driver when driver_version is nil' do
      allow(Jdbc::Mssql).to receive(:driver_version).and_return(nil)

      expect { Jdbc::Mssql.load_driver }.to raise_error(RuntimeError)
    end

    it 'should return false for current java specification version (driver is loaded)' do

      expect(Jdbc::Mssql.load_driver).to eq(false)
    end
  end

  context ".jar_file" do
    Jdbc::Mssql::JAVA_VERSIONS.each do |version_key, _|
      it "should exist driver jar file for java specification version '#{version_key}'" do
        allow(Jdbc::Mssql).to receive(:java_specification_version).and_return(version_key)
        jar_file = Jdbc::Mssql.jar_file
        #puts jar_file
        expect(File.exist? "./lib/#{jar_file}").to eq(true)
      end
    end
  end
  # specs ends here
end
