# bjn_logstash

Install and configure Logstash.



## Requirements

This cookbook depends on `ark` to deploy releases and `runit` to manage
services. It supports these platforms:

- Ubuntu 12.04
- Ubuntu 14.04

You must also ensure Java is installed. We suggest the `java` cookbook.



## Attributes

See the attribute file for inline documentation.



## Recipes

### default

This recipe creates a `logstash` user, installs the code from a tarball, and
creates a `logstash` service to manage the instance.



## Resources

### conf

You can use the `bjn_logstash_conf` resource to override the default Logstash
configuration file by providing it the name of template in your cookbook. By
default the configuration is built from attributes.