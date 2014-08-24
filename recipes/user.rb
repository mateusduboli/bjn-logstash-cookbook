#
# Cookbook Name:: bjn_logstash
# Recipe:: user
#
# Copyright (C) 2014 Blue Jeans Network
#

group node['logstash']['user']

user node['logstash']['user'] do
  gid node['logstash']['user']
  home node['logstash']['home']
  comment 'logstash'
  shell '/bin/false'
  system true
end