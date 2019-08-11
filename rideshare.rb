rideshare = {
  "DR0004" => [
    {
      rider_id: "RD0022",
      date: "3rd Feb 2016",
      cost: 5,
      rating: 5
    },
    {
      rider_id: "RD0022",
      date: "4th Feb 2016",
      cost: 10,
      rating: 4
    },
    {
      rider_id: "RD0073",
      date: "5th Feb 2016",
      cost: 20,
      rating: 5
    }
  ],
  "DR0001" => [
    {
      rider_id: "RD0003",
      date: "3rd Feb 2016",
      cost: 10,
      rating: 3
    },
    {
      rider_id: "RD0015",
      date: "3rd Feb 2016",
      cost: 30,
      rating: 4
    },
    {
      rider_id: "RD0003",
      date: "5th Feb 2016",
      cost: 45,
      rating: 2
    }
  ],
  "DR0002" => [
    {
      rider_id: "RD0073",
      date: "3rd Feb 2016",
      cost: 25,
      rating: 5
    },
    {
      rider_id: "RD0013",
      date: "4th Feb 2016",
      cost: 15,
      rating: 1
    },
    {
      rider_id: "RD0066",
      date: "5th Feb 2016",
      cost: 35,
      rating: 3
    }
  ], 
  "DR0003" => [
    {
      rider_id: "RD0066",
      date: "4th Feb 2016",
      cost: 5,
      rating: 5
    },
    {
      rider_id: "RD0003",
      date: "5th Feb 2016",
      cost: 50,
      rating: 2
    }
  ]
}

def calc_total (rides, key)
  return rides.map {|ride| ride[key]}.reduce(:+)
end

def compare (current_highest, test_value)
  return [current_highest, test_value].max_by {|value| value[:high]}
end

highest_total_income = {
  driver: "Unkown",
  high: 0.0
}

highest_average_rating = {
  driver: "Unknown",
  high: 0.0
}

print "\n"
puts "DRIVER DETAILS:"
rideshare.each do | driver, rides |
  # calculates average rating and total income for each driver
  total_rating = calc_total(rides, :rating)
  average_rating = total_rating.to_f/rides.length
  total_income = calc_total(rides, :cost)
  
  profitable_day = {
    driver: driver,
    high_day: "",
    high: 0.0
  }
  
  # calculates most profitable day for each driver
  rides.each do | ride |
    profitable_day = compare(profitable_day, {driver: driver, high_day: ride[:date], high: ride[:cost]})
  end
  
  # determines if driver had highest total income or highest average rating
  highest_total_income = compare(highest_total_income, {driver: driver, high: total_income})
  highest_average_rating = compare(highest_average_rating, {driver: driver, high: average_rating})
  
  puts "#{driver} gave #{rides.length} rides, made $#{'%.2f' % total_income}, had an average rating of #{'%.2f' % (average_rating)},and made the most money on #{profitable_day[:high_day]}."
end

print "\n"
puts "SUMMARY:"
puts "#{highest_total_income[:driver]} had the highest total income of $#{'%.2f' % highest_total_income[:high]}. #{highest_average_rating[:driver]} had the highest average rating of #{'%.2f' % highest_average_rating[:high]}."
print "\n"
