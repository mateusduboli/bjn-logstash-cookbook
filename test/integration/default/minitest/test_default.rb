require 'minitest/autorun'

describe 'bjn_logstash::default' do
  it 'has created and started the logstash service' do
    `service logstash status`
    assert $?.exitstatus.zero?
  end
end