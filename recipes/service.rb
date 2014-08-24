#
# Cookbook Name:: bjn_logstash
# Recipe:: service
#
# Copyright (C) 2014 Blue Jeans Network
#

include_recipe 'runit'

runit_service 'logstash' do
  owner node['logstash']['user']
  group node['logstash']['user']
end