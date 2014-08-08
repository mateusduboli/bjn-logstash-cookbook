#
# Cookbook Name:: bjn_logstash
# Recipe:: default
#
# Copyright (C) 2014 Blue Jeans Network
#


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
  group node['logstash']['user']
  notifies :restart, 'service[logstash]', :delayed
end

%w[ scan seq enterprise_name ].each do |filter|
  cookbook_file "filter_#{filter}.rb" do
    path "#{node['logstash']['home']}/lib/logstash/filters/#{filter}.rb"
    backup false
    notifies :restart, 'service[logstash]', :delayed
  end
end

directory ::File.dirname(node['logstash']['conf']) do
  owner node['logstash']['user']
  group node['logstash']['user']
end

template node['logstash']['conf'] do
  source 'conf.erb'
  owner node['logstash']['user']
  group node['logstash']['user']
  notifies :restart, 'runit_service[logstash]', :delayed
end

runit_service 'logstash' do
  owner node['logstash']['user']
  group node['logstash']['user']
end
