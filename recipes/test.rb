#
# Cookbook Name:: bjn_logstash
# Recipe:: test
#
# Copyright (C) 2014 Blue Jeans Network
#

include_recipe 'bjn_logstash'

bjn_logstash_conf 'test.conf.erb'