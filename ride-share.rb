drivers_statistics = {
  DR0001: [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2
    } 
  ],
  DR0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3
    } 
  ],
  DR0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5
    }
  ]  
}

total_driver_earnings = []
total_driver_ratings = []
driver_highest_earnings = []
driver_highest_rating = []

drivers_statistics.each do |driver_id, rides|
  rides.each do |ride_info|
    total_driver_earnings.push(ride_info[:cost])
    total_driver_ratings.push(ride_info[:rating])
  end

  "\nDriver #{driver_id}:"
  "\nNumber of rides given - #{drivers_statistics[driver_id].length} rides"
  "Total amount of money made - $#{(total_driver_earnings.sum)}"
  "Average rating - #{'%.2f' % (total_driver_ratings.sum.to_f/total_driver_ratings.length)}"

  driver_highest_rating << '%.2f' % ((total_driver_ratings.sum.to_f/total_driver_ratings.length))

  driver_highest_earnings.push(total_driver_earnings.sum)

  total_driver_earnings.clear
  total_driver_ratings.clear
end 

"\n~Driver with the highest average rating~"
"Driver DR000#{driver_highest_rating.index(driver_highest_rating.max) + 1} - #{driver_highest_rating.max}" 

"\n~Driver with highest earnings~" 
"Driver DR000#{driver_highest_earnings.index(driver_highest_earnings.max) + 1}: $#{driver_highest_earnings.max}"
