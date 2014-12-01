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
end

directory node['logstash']['conf'] do
  owner node['logstash']['user']
  group node['logstash']['user']
end

include_recipe 'runit'

node['logstash']['config'].each do |name, config|
  service = "logstash-#{name}"
  path = File.join node['logstash']['conf'], "#{name}.conf"

  file path do
    content logstash_config(config)
    owner node['logstash']['user']
    group node['logstash']['user']
    notifies :restart, "runit_service[#{service}]", :delayed
  end

  runit_service service do
    template_name 'logstash'
    run_template_name 'logstash'
    log_template_name 'logstash'
    check_script_template_name 'logstash'
    finish_script_template_name 'logstash'
    restart_on_update false
    owner node['logstash']['user']
    group node['logstash']['user']
    options \
      config: path,
      log: "#{node['logstash']['logs']}/logstash-#{name}.log"
  end
end