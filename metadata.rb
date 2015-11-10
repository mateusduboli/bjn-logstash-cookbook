name             'bjn_logstash'
version          File.read(File.join(File.dirname(__FILE__), 'VERSION')).strip
description      'Install and configure Logstash'
long_description 'Install and configure Logstash'
maintainer       'Sean Clemmer / Blue Jeans Network'
maintainer_email 'sclemmer@bluejeans.com'
license          'ISC'

depends 'ark'
depends 'runit'
depends 'magic', '>= v1.2'

suggests 'bjn_java'
