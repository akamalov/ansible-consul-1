require 'spec_helper'


describe 'Consul template' do

    describe service('consul-template') do
      it { should be_enabled }
      it { should be_running }
    end

    describe file('/etc/consul-template.conf') do
      it { should be_file }
      it { should be_mode 640 }
      it { should be_owned_by 'consul' }
      it { should be_grouped_into 'consul' }
    end

    describe file('/etc/haproxy/haproxy.cfg') do
        its(:content) { should contain "# First template  : Ansible managed, Don't modify manually\n# Second template : consul template"}
    end

end



