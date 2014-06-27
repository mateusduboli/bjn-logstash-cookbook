# encoding: utf-8
# Sean Clemmer / Blue Jeans Network
require 'logstash/filters/base'
require 'logstash/namespace'

# Add a sequential identifier to events.
#
# This filter simply maintains a threadsafe counter, which is incremented every
# time the filter is applied to an event.
class LogStash::Filters::Seq < LogStash::Filters::Base
  config_name 'seq'
  milestone 1

  # Target field for identifier
  config :target, :validate => :string, :default => '@seq'

  def initialize params
    super params
  end

  def register
    require 'thread'
    @mutex = Mutex.new
    @seq = 0
  end

  def filter event
    @mutex.synchronize do
      event[@target] = @seq
      @seq += 1
    end
  end
end