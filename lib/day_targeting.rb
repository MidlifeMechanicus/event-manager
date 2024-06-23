require "csv"
require "date"

def find_call_day(string)
  date = Date.strptime(string[:regdate][0..-6].strip.insert(-3, "20"), "%m/%d/%Y")
  date.wday
  # format is month day year, the us standard
end

def find_week_days(date_list)
  week_days = date_list.sort.map do |day|
    case day
    when 0
      day = "Sunday"
    when 1
      day = "Monday"
    when 2
      day = "Tuesday"
    when 3
      day = "Wednesday"
    when 4
      day = "Thursday"
    when 5
      day = "Friday"
    when 6
      day = "Saturday"
    end
  end
  puts week_days.tally
end

puts "Day Targeting Initialized!"

content = CSV.open(
  "event_attendees.csv",
  headers: true,
  header_converters: :symbol
)

call_days = []

content.each do |row|
  call_day = find_call_day row
  call_days << call_day
end

find_week_days call_days
