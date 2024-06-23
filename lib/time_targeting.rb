require "csv"
require "time"

def find_call_hour string
  Time.parse(string[:regdate][-5..-1]).hour
end

puts "Time Targeting Initialized!"

content = CSV.open(
  "event_attendees.csv",
  headers: true,
  header_converters: :symbol
)

call_times = []

content.each do |row|
  call_hour = find_call_hour row
  call_times << call_hour
end

p call_times.sort.tally
