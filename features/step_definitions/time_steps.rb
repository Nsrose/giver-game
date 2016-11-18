#We got this code from stack overflow linked to https://gist.github.com/jamesarosen/154616
def parse_time(time)
Chronic.parse(time) || Time.parse(time)
end

Given /^it is currently (.+)$/ do |time|
    Timecop.travel parse_time(time)
end

Given /^time is frozen at (.+)$/ do |time|
    Timecop.freeze parse_time(time)
end

Given /^(?:I|we) return to the present$/ do
  Timecop.return
end