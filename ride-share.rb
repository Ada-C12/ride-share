LIBER = {

  "DR0001" => [

    {
    date: "02/03/2016",
    cost: 10,
    rating: 3
    },

    {
    date: "02/03/2016",
    cost: 30,
    rating: 4
    },

    {
    date: "02/05/2016",
    cost: 45,
    rating: 2
    }

  ],

  "DR0002" => [

    {
    date: "02/03/2016",
    cost: 25,
    rating: 5
    },

    {
    date: "02/04/2016",
    cost: 15,
    rating: 1
    },

    {
    date: "02/05/2016",
    cost: 35,
    rating: 3
    }

  ],

  "DR0003" => [

    {
    date: "02/04/2016",
    cost: 5,
    rating: 5
    },

    {
    date: "02/05/2016",
    cost: 50,
    rating: 2
    }

  ],

  "DR0004" => [

    {
    date: "02/03/2016",
    cost: 5,
    rating: 5
    },

    {
    date: "02/04/2016",
    cost: 10,
    rating: 4
    },

    {
    date: "02/05/2016",
    cost: 20,
    rating: 5
    }

  ]

}

def super_sum(hash, array, key)
  new_array = hash[array].map {|x| x[key]}
  result = new_array.sum
  return result
end

puts "\n1. The number of rides each driver has given:"
LIBER.each do |driver, ride|
  puts "Driver #{driver} had #{ride.length} rides"
end

puts "\n2. The total amount of money each driver has made:"
m = 1
earnings = {}
4.times do
  earning_m = super_sum(LIBER, "DR000" + m.to_s,:cost)
  earnings.merge! "DR000"+m.to_s => earning_m
  puts "Driver DR000#{m} made $ #{earning_m}"
  m += 1
end

puts "\n3. The average rating for each driver:"
m = 1
ratings = {}
4.times do
  rating_sum_m = super_sum(LIBER, "DR000" + m.to_s,:rating)
  rating_m = (rating_sum_m.to_f/ LIBER["DR000" + m.to_s].length.to_f).round(1)
  ratings.merge! "DR000"+m.to_s => rating_m
  puts "Driver DR000#{m}'s rating is #{rating_m}"
  m += 1
end

puts "\n4. Driver made the most money:"
puts "Driver #{earnings.key(earnings.values.max)} made the most money"

puts "\n5. Driver with the highest rating:"
puts "Driver #{ratings.key(ratings.values.max)} has the highest rating"

exit
