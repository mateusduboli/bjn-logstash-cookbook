def quote_logstash o
  case o.class.to_s
  when /Array/
    '[ %s ]' % o.map { |c| quote_logstash c }.join(', ')
  when /Regexp/
    o.to_s.inspect
  else
    o.inspect
  end
end