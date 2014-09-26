# Version of Logstash to install
default['logstash']['version'] = '1.4.2'

# SHA-256 checksum for the given version
default['logstash']['checksum'] = \
  'abb0549554209d1e473b0d4abae86850c020d942f160b384dd79fd994e780d1d'

# URL pattern for Logstash releases
default['logstash']['url'] = \
  'http://10.100.0.15/inf/logstash-%{version}.tar.gz'

# User for Logstash assets and services
default['logstash']['user'] = 'logstash'

# Home of Logstash source
default['logstash']['home'] = '/opt/logstash'

# Home of Logstash logs
default['logstash']['logs'] = '/var/log/logstash'

# Path to Logstash configuration
default['logstash']['conf'] = '/etc/logstash'

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
# conditional to select the appropriate type. See the bjn_helpers cookbook for
# more specifics. Commented out so you can include_recipe[bjn_logstash] multiple
# times without accidentally blowing out other configs.

# default['logstash']['config']['example']['input'] = {
#   # 'logstash' => {
#   #   'file' => {
#   #     'stat_interval' => 60,
#   #     'path'  => File.join(node['logstash']['logs'], 'bogus.log'),
#   #     'codec' => 'json'
#   #   }
#   # }
#   #
#   # # Looks something like this in the config:
#   # #
#   # #     file {
#   # #       type => "logstash"
#   # #       path => "/var/log/logstash/*.log"
#   # #       codec => "json"
#   # #     }
#   # #
# }

# default['logstash']['config']['example']['filter'] = {
#   # 'logstash' => {
#   #   'seq' => {},
#   #   'scan' => {
#   #     'target' => 'digits',
#   #     'match' => [ 'message', /\b\d+\b/ ]
#   #   }
#   # }
#   #
#   # # Looks something like this in the config:
#   # #
#   # #     if [type] == "logstash" {
#   # #       seq {}
#   # #       scan {
#   # #         target => "digits"
#   # #         match => [ "message", "\\b\\d+\\b" ]
#   # #       }
#   # #     }
#   # #
# }

# default['logstash']['config']['example']['output'] = {
#   # 'logstash' => {
#   #   'file' => {
#   #     'path' => '/dev/null'
#   #   }
#   # }
#   #
#   # # Looks something like this in the config:
#   # #
#   # #     if [type] == "logstash" {
#   # #       file {
#   # #         path => "/dev/null"
#   # #       }
#   # #     }
#   # #
# }