require 'spec_helper'
describe 'ctrlaltdel' do

  context 'with defaults for all parameters' do
    it { should contain_class('ctrlaltdel') }
  end
end
