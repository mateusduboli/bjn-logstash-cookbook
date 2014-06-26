#
# Cookbook Name:: bjn_logstash
# Recipe:: default
#
# Copyright (C) 2014 Blue Jeans Network
#

include_recipe 'bjn_java'

include_recipe 'runit'

group node['logstash']['user']

user node['logstash']['user'] do
  gid node['logstash']['user']
  home node['logstash']['home']
  comment 'logstash'
  shell '/bin/false'
  system true
end

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
end

cookbook_file 'multiply' do
  path "#{node['logstash']['home']}/bin/multiply"
  backup false
  mode 0755
end

runit_service 'logstash' do
  owner node['logstash']['user']
  group node['logstash']['user']
end