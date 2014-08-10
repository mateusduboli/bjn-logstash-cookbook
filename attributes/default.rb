# Version of Logstash to install
default['logstash']['version'] = '1.4.2'

# SHA-256 checksum for the given version
default['logstash']['checksum'] = \
  'b27c12ef625eaba7df040d065e2a985b4614f333bf045a3476c3d64776c1f70c'

# URL pattern for Logstash releases
default['logstash']['url'] = \
  'http://10.100.0.15/inf/logstash-%s.tar.gz' % \
    node['logstash']['version']

# User for Logstash assets and services
default['logstash']['user'] = 'logstash'

# Home of Logstash source
default['logstash']['home'] = '/opt/logstash'

# Home of Logstash logs
default['logstash']['logs'] = '/var/log/logstash'

# Path to Logstash configuration
default['logstash']['conf'] = '/etc/logstash/logstash.conf'

# Enable debug logging [boolean]
default['logstash']['debug?'] = false

# Number of concurrent Logstash filter workers
# You might consider setting this to node['cpu']['total']
default['logstash']['workers'] = 1

# Configure a default JVM heap size value
default['logstash']['heap_size'] = '512m'



# The last few attributes drive the Logstash configuration file. The native
# Ruby hashes are converted into Logstash format in a fairly straightforward
# manner: Top-level hashes map an arbitrary "type" to an input, filter, or
# output. Inputs are assigned the type, while filters and outputs use a
# conditional to select the appropriate type. You can leave the type nil to
# avoid generating all that. Array and Regex support would be nice.

default['logstash']['config']['input'] = {
  'logstash' => {
    'file' => {
      'stat_interval' => 60,
      'path'  => File.join(node['logstash']['logs'], 'bogus.log'),
      'codec' => 'json'
    }
  }

  # Looks something like this in the config:
  #
  #     file {
  #       type => "logstash"
  #       path => "/var/log/logstash/*.log"
  #       codec => "json"
  #     }
  #
}

default['logstash']['config']['filter'] = {
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

default['logstash']['config']['output'] = {
  'logstash' => {
    'file' => {
      'path' => '/dev/null'
    }
  }

  # Looks something like this in the config:
  #
  #     if [type] == "logstash" {
  #       file {
  #         path => "/dev/null"
  #       }
  #     }
  #
}
