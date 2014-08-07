def quote_logstash o
  case o.class.to_s
  when /Array/
    '[ %s ]' % o.map { |c| quote_logstash c }.join(', ')
  when /Regexp/
    "'%s'" % o.to_s
  when /Symbol/
    o.to_s
  when /TrueClass/
    'true'
  when /FalseClass/
    'false'
  else
    o.inspect.gsub('\\\\', '\\')
  end
end