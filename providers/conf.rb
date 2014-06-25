def whyrun_supported?
  true
end

action :use do
  directory ::File.dirname(node['logstash']['conf']) do
    owner node['logstash']['user']
    group node['logstash']['user']
  end

  template node['logstash']['conf'] do
    source new_resource.name
    owner node['logstash']['user']
    group node['logstash']['user']
    notifies :restart, 'runit_service[logstash]', :delayed
  end

  new_resource.updated_by_last_action(true)
end