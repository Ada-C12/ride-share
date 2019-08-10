rides = {
    DR0004: [
      {date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5},
      {date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4}, 
      {date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5}
    ],
    DR0003: [
      {date: "4th Feb 2016", cost: 5, rider_id: "RD0066,", rating: 5},
      {date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2}
    ],
    DR0002: [
      {date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5}, 
      {date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1},
      {date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3}
    ],
    DR0001: [
      {date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3},
      {date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2}
    ]
  }

driver_rides = {}
driver_money = {}
driver_rating = {}
highest_earning_day = {}

rides.each do |key, values|
  driver_rides[key] = (values.length)
  driver_money[key] = values.map {|ride| ride[:cost]}.sum
  summed_rating = values.map { |ride| ride[:rating] }.sum
  driver_rating[key] = ("%.2f" % (summed_rating /values.length.to_f)) 
  highest_earning_day[key] = values.reduce do |memo, ride|
    memo[:cost] > ride[:cost] ? memo : ride
  end
end

driver_rides.each do |ride|
  puts "Driver - #{ ride[0] }: #{ ride[1] } rides."
end

puts 
driver_money.each do |money|
  puts "Driver - #{ money[0] }: total earnings are $#{ "%.2f" % money[1] }."
end

puts
driver_rating.each do |rating|
  puts "Driver - #{ rating[0] }: average rating is #{rating[1] }."
end

puts
highest_earning_day.each do |driver, day|
  puts "Driver #{ driver } earned the most money on #{ day[:date] }."
end

puts 
puts "Highest Earner: #{ driver_money.max_by { |driver, money| money}[0] }"

puts
puts "Highest Average Rating: #{ driver_rating.max_by{|driver, rating| rating}[0] }"
