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
  'd5be171af8d4ca966a0c731fc34f5deeee9d7631319e3660d1df99e43c5f8069'

# Full URL (%-pattern-sensitive) for Logstash releases
default['logstash']['url'] = \
  'https://download.elasticsearch.org/logstash/logstash/logstash-%{version}.tar.gz'

# Enable debug logging (must be boolean)
default['logstash']['debug?'] = false

# Number of concurrent Logstash agents
default['logstash']['agents'] = 1

# Number of concurrent Logstash filter workers
# For production nodes, consider setting this to node['cpu']['total']
default['logstash']['workers'] = 1

# Configure a default JVM heap size value
default['logstash']['heap_size'] = nil