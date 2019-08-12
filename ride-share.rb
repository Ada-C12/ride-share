drivers = {
  DR0004: [
    {date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5},
    {date: "4th Feb 2016", cost: 10, rider_id: "RD0022",rating: 4},
    {date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5}
  ],
  DR0001: [
    { date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3},
    { date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4},
    {date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2}
  ],
  DR0002: [
    {date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5},
    {date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1},
    {date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3}
  ],
  DR0003: [
    {date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5},
    {date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2},
  ]
}

highest_total_earnings = {driver: nil, earnings: 0}
highest_rated = {driver: nil, ratings: 0}

def driver_earnings(drives_hash)
  driver_earnings = drives_hash.map do |trip|
    trip[:cost]
  end
end

def driver_ratings(drives_hash)
  driver_ratings = drives_hash.map do |trip|
    trip[:rating]
  end
end

drivers.each do |driver, rides|
  puts "Driver #{driver} gave #{rides.size} rides."
end

puts ""

drivers.each do |driver, rides|
  earnings = driver_earnings(rides).sum
  puts "#{driver} earned a total of $#{sprintf('%.2f', earnings)}."
  
  if earnings > highest_total_earnings[:earnings]
    highest_total_earnings[:driver] = driver
    highest_total_earnings[:earnings] = earnings
  end
end 

puts ""

drivers.each do |driver, rides|
  ratings = driver_ratings(rides).sum / driver_ratings(rides).size.to_f
  puts "#{driver} had an average rating of #{sprintf('%.2f', ratings)}."

  if ratings > highest_rated[:ratings]
    highest_rated[:driver] = driver
    highest_rated[:ratings] = ratings
  end
end

puts ""

puts "Driver #{highest_total_earnings[:driver]} earned the most with a total of $#{sprintf('%.2f', highest_total_earnings[:earnings])}."
puts "Driver #{highest_rated[:driver]} had the highest average rating of #{sprintf('%.2f', highest_rated[:ratings])}."
