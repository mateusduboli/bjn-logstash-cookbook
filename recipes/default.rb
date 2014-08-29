#
# Cookbook Name:: bjn_logstash
# Recipe:: default
#
# Copyright (C) 2014 Blue Jeans Network
#

node.default['logstash'] = materialize(node['logstash'])

include_recipe 'bjn_logstash::user'

directory node['logstash']['logs'] do
  owner node['logstash']['user']
  group node['logstash']['user']
end

ark 'logstash' do
  url node['logstash']['url']
  checksum node['logstash']['checksum']
  version node['logstash']['version']
  home_dir node['logstash']['home']
  owner node['logstash']['user']
  group node['logstash']['user']
  notifies :restart, 'service[logstash]', :delayed
end

directory ::File.dirname(node['logstash']['conf']) do
  owner node['logstash']['user']
  group node['logstash']['user']
end

file node['logstash']['conf'] do
  content logstash_config(node['logstash']['config'])
  owner node['logstash']['user']
  group node['logstash']['user']
  notifies :restart, 'runit_service[logstash]', :delayed
end

include_recipe 'bjn_logstash::service'