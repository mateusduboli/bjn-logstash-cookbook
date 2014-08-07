# bjn_logstash

Installs and configures [Logstash](http://logstash.net) with some additional
plugins.

## Requirements

This cookbook depends on `ark` and `runit`, but a recent Java should be
installed, thus we suggest the `bjn_java` cookbook. The following platforms are
officially supported:

* Ubuntu 12.04
* Ubuntu 14.04

## Attributes

Attributes are documented inline, so check out `attributes/default.rb`. Pay
special attention to the configuration file specification.

## Recipes

This cookbook contains only one recipe, `default`, which manages Logstash.