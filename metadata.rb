name             'bjn_logstash'
version          File.read(File.join(File.dirname(__FILE__), 'VERSION')).strip
description      'Install and configure Logstash'
long_description 'Install and configure Logstash'
maintainer       'Sean Clemmer / Blue Jeans Network'
maintainer_email 'sclemmer@bluejeans.com'

depends 'ark'
depends 'runit'

suggests 'bjn_java'