require "csv"

def clean_phone(phone)
  # zipcode.to_s.rjust(5,"0")[0..4]
  raw_number = phone.gsub(/[^0-9]/, "")
  if raw_number.length < 10
    raw_number = "Bad Number"
  elsif raw_number.length > 10
    if raw_number.chr == "1" && raw_number.length == 11
      raw_number = raw_number[1..-1]
    else
      raw_number = "Bad Number"
    end
  end
  puts raw_number
end

puts "Phone Manager Initialized!"

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  clean_phone row[:homephone]
end