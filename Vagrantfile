#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--memory', 4096 ]
    vb.customize [ 'modifyvm', :id, '--cpus', 4 ]
    vb.customize [ 'modifyvm', :id, '--ioapic', 'on' ]
  end
  config.vm.define 'vagrant' do |node|
    node.vm.box = 'chef/ubuntu-12.04'
    node.vm.hostname = 'vagrant'
    node.vm.network :private_network, :ip => '10.10.10.10'
    node.vm.network :forwarded_port, guest: 9200, host: 9200
    node.vm.network :forwarded_port, guest: 9300, host: 9300
    node.vm.provision :chef_solo do |chef|
      chef.log_level = :info
      chef.json = {
        logstash: {
          config: {
            example: {
              input: {
                test: {
                  file: {
                    path: '/bogus.log'
                  }
                }
              },
              filter: {
                test: {
                  seq: {}
                }
              },
              output: {
                test: {
                  stdout: {}
                }
              }
            }
          }
        }
      }
      chef.run_list = %w(
        recipe[apt]
        recipe[bjn_java]
        recipe[bjn_logstash]
      )
    end
  end
end