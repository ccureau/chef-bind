require 'spec_helper'

describe "bind::default" do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(
      platform: 'redhat',
      version: '6.5',
      log_level: :error
    )
    Chef::Config.force_logger true
    runner.converge('recipe[bind::default]')
  end

  it "installs bind" do
    expect(chef_run).to install_package('bind')
  end

  it "installs bind-utils" do
    expect(chef_run).to install_package('bind-utils')
  end
end
