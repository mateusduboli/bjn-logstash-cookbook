# encoding: utf-8
# Sean Clemmer / Blue Jeans Network
require 'logstash/filters/base'
require 'logstash/namespace'

# Scan arbitrary text for regex matches.
#
# Use this filter to scan a field for regex matches and save those matches to
# a target field. Note that the regular expression you provide must be a regular
# Ruby Regexp without Grok patterns.
class LogStash::Filters::Scan < LogStash::Filters::Base
  config_name 'scan'
  milestone 1

  # A hash of matches of field => regex
  #
  # For example:
  #
  #     filter {
  #       scan {
  #         match => [ "message", "\b\d+\b" ]
  #       }
  #     }
  #
  config :match, :validate => :hash, :requried => true

  # Target field for matches
  config :target, :validate => :string, :requried => true

  def initialize params
    super params
  end

  def register
    @patterns = Hash.new { |h,k| h[k] = [] }
    @match.each do |field, pattern|
      @patterns[field] = Regexp.new(pattern)
    end
  end

  def filter event
    return unless filter?(event)

    results = []
    @patterns.each do |field, regex|
      event_field = event[field].to_s
      event_field = event_field.join if event_field.is_a? Array
      results    += event_field.to_s.scan(regex)
    end

    results = results.flatten.uniq
    unless results.empty?
      event[@target] ||= []
      event[@target]  += results
      filter_matched(event)
    end
  end
end
