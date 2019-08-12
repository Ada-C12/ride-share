
drivers = {
  DR0001: [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider: "RD0003", 
      rating: 3
    }, 
    {
      date: "3rd Feb 2016", 
      cost: 30, 
      rider: "RD0015",
      rating: 4 
    }, 
    {
      date: "5th Feb 2016",
      cost: 45,
      rider: "RD0003",
      rating: 2
    },
  ],
  DR0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider: "RD0073",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider: "RD0013",
      rating: 1
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider: "RD0066",
      rating: 3
    }
  ],
  DR0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider: "RD0066",
      rating: 5
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider: "RD0003",
      rating: 2
    }
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider: "RD0022",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider: "RD0022",
      rating: 4
    },
    {
      date: "5th Feb 201",
      cost: 20,
      rider: "RD0073",
      rating: 5
    }
  ]
}


high_rating = 0
high_earn = 0
driver_rating = ""
driver_earn = ""


drivers.each do |key, value|
  earnings = 0
  score = 0
  value.each do |i|
    earnings += i[:cost]
    score += i[:rating]
  end
  avg_score = score.to_f/value.length
  if avg_score > high_rating
    high_rating = avg_score
    driver_rating = key.to_s
  end
  if earnings > high_earn
    high_earn = earnings
    driver_earn = key.to_s
  end
  puts "#{key.to_s} has an average rating of #{avg_score}, has given #{value.length} rides, and has made $#{earnings}"
end 

puts "The driver who earned the most is #{driver_earn}, who made $#{high_earn}"
puts "The driver with the highest average rating is #{driver_rating} with a #{high_rating}"


