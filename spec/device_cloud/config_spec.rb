require 'device_cloud/config'
require 'tempfile'

describe DeviceCloud::Config do
  let(:new_value) { 'not-localhost' }

  describe '.get' do
    context 'for valid attributes' do
      subject { DeviceCloud::Config.get(:username) }

      context 'with no overridden value' do
        it { should == 'guest' }
      end

      context 'with an overridden value' do
        before { DeviceCloud::Config.stub(user_config: {username: new_value}) }
        it { should == new_value }
      end
    end

    context 'for invalid attributes' do
      let(:invalid_get) { -> { DeviceCloud::Config.get(:invalid_attr) } }
      specify { invalid_get.should raise_error DeviceCloud::UnknownAttributeError }
    end
  end

  describe '.set' do
    context 'for valid attributes' do
      before { DeviceCloud::Config.set(:username, new_value) }
      subject { DeviceCloud::Config.user_config[:username] }

      context 'sets value in user config hash' do
        it { should == new_value }
      end
    end

    context 'for invalid attributes' do
      let(:invalid_set) { -> { DeviceCloud::Config.set(:invalid_attr, new_value) } }
      specify { invalid_set.should raise_error DeviceCloud::UnknownAttributeError }
    end
  end

  describe 'a magic getter' do
    context 'for a valid attribute' do
      it 'calls get' do
        DeviceCloud::Config.should_receive(:get).with(:username)
        DeviceCloud::Config.username
      end
    end

    context 'for an invalid attribute' do
      let(:invalid_getter) { -> { DeviceCloud::Config.invalid_attr } }
      specify { invalid_getter.should raise_error NoMethodError }
    end
  end

  describe 'a magic setter' do
    context 'for a valid attribute' do
      it 'calls set' do
        DeviceCloud::Config.should_receive(:set).with(:username, new_value)
        DeviceCloud::Config.username = new_value
      end
    end

    context 'for an invalid attribute' do
      let(:invalid_setter) { -> { DeviceCloud::Config.invalid_attr = new_value } }
      specify { invalid_setter.should raise_error NoMethodError }
    end
  end

  describe '.load_from_file' do
    let(:host) { 'broker.yourhost.com' }
    let(:username) { 'calvin' }
    let(:file) do
      Tempfile.new('configs.yaml').tap do |t|
        t.write(YAML.dump(config_data))
        t.rewind
      end
    end

    context 'when an attribute is invalid' do
      let(:config_data) { {random_attribute: 'socks'} }
      it 'raises an error' do
        expect {
          DeviceCloud::Config.load_from_file(file)
        }.to raise_error(NoMethodError)
      end
    end

    context 'when attributes are valid' do
      let(:config_data) { {username: host, password: username} }

      it 'loads in the config data' do
        DeviceCloud::Config.load_from_file(file)
        DeviceCloud::Config.username.should eq host
        DeviceCloud::Config.password.should eq username
      end
    end
  end
end