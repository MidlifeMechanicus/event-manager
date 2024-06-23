require "csv"

def clean_phone(phone)
  raw_number = phone.gsub(/[^0-9]/, "")
  # This replaces everything EXCEPT 0-9 with ""
  if raw_number.length < 10
    raw_number = "Bad Number"
  elsif raw_number.length > 10
    raw_number = if raw_number.chr == "1" && raw_number.length == 11
                   raw_number[1..-1]
                 else
                   "Bad Number"
                 end
  end
  puts raw_number
end

puts "Phone Manager Initialized!"

contents = CSV.open(
  "event_attendees.csv",
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  clean_phone row[:homephone]
end
