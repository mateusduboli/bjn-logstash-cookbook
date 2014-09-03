require 'minitest/autorun'

describe 'bjn_logstash::default' do
  it 'has created and started the logstash-test service' do
    `service logstash-test status`
    assert $?.exitstatus.zero?
  end
end