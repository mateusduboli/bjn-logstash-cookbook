# User for Logstash directories, files, and services
default['logstash']['user'] = 'logstash'

# Directory to install the Logstash source
default['logstash']['home'] = '/opt/logstash'

# Directory to store the Logstash logs
default['logstash']['logs'] = '/var/log/logstash'

# Path to the Logstash configuration
default['logstash']['conf'] = '/etc/logstash/logstash.conf'

# Version of Logstash to install
default['logstash']['version'] = '1.4.2'

# SHA-256 checksum for the bundled release
default['logstash']['checksum'] = \
  'a29943d8d9ac36332614793430f5c238ddcd3b84b1b26251dab263dddbd26435'

# Full URL for Logstash releases
default['logstash']['url'] = \
  'http://10.100.0.15/inf/logstash-%s.tar.gz' % \
    node['logstash']['version']

# Enable debug logging (must be boolean)
default['logstash']['debug?'] = false

# Number of concurrent Logstash filter workers
# You might consider setting this to node['cpu']['total']
default['logstash']['workers'] = 1

# Configure a default JVM heap size value
default['logstash']['heap_size'] = '300m'



# The last few attributes drive the Logstash configuration file. The native
# Ruby hashes are converted into Logstash format in a fairly straightforward
# manner: Top-level hashes map an arbitrary "type" to an input, filter, or
# output. Inputs are assigned the type, while filters and outputs use a
# conditional to select the appropriate type. You can leave the type nil to
# avoid generating all that. Array and Regex support would be nice.

default['logstash']['input'] = {
  # 'logstash' => {
  #   'file' => {
  #     'path'  => File.join(node['logstash']['logs'], 'logstash.log'),
  #     'codec' => 'json'
  #   }
  # }
  #
  # # Looks something like this in the config:
  # #
  # #     file {
  # #       type => "logstash"
  # #       path => "/var/log/logstash.log"
  # #       codec => "json"
  # #     }
  # #
}

default['logstash']['filter'] = {
  # 'logstash' => {
  #   'seq' => {},
  #   'scan' => {
  #     'target' => 'digits',
  #     'match' => [ 'message', /\b\d+\b/ ]
  #   }
  # }
  #
  # # Looks something like this in the config:
  # #
  # #     if [type] == "logstash" {
  # #       seq {}
  # #       scan {
  # #         target => "digits"
  # #         match => [ "message", "\\b\\d+\\b" ]
  # #       }
  # #     }
  # #
}

default['logstash']['output'] = {
  # 'logstash' => {
  #   'file' => {
  #     'path' => File.join(node['logstash']['logs'], 'logstash.out')
  #   }
  # }
  #
  # # Looks something like this in the config:
  # #
  # #     if [type] == "logstash" {
  # #       file {
  # #         path => "/var/log/logstash.out"
  # #       }
  # #     }
  # #
}