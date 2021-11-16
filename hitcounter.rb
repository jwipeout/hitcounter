@events = Hash.new({ count: 0, time: Time.now })
@reports = {}
@time_passed = 5

def hit(s)
  @last_hit_time = Time.now

  if @events[s] && @events[s][:time].to_i >= Time.now.to_i - @time_passed
    @events[s] = { count: @events[s][:count] + 1, time: Time.now }
  elsif @events[s]
    @events[s] = { count: 1, time: Time.now }
  end

  @reports[s] = @events[s][:count]
end

def report
  return 'empty' if @last_hit_time < Time.now - @time_passed
  @reports
end

hit('e')
hit('e')
hit('e')
hit('e')
hit('b')
hit('b')
puts report.inspect
sleep(6)
puts report.inspect
hit('e')
hit('b')
hit('b')
puts report.inspect
