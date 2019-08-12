ride_share = {
  DR0001: [
    {
      date: "3rd Feb 2016",
      rider: "RD0003",
      cost: 10,
      rating: 3
    },
    {
      date: "3rd Feb 2016",
      rider: "RD0015",
      cost: 30,
      rating: 4
    },
    {
      date: "5th Feb 2016",
      rider: "RD0003",
      cost: 45,
      rating: 2
    }
  ],
  DR0002: [
    {
      date: "3rd Feb 2016",
      rider: "RD0073",
      cost: 25,
      rating: 5
    },
    {
      date: "4th Feb 2016",
      rider: "RD0013",
      cost: 15,
      rating: 1
    },
    {
      date: "5th Feb 2016",
      rider: "RD0066",
      cost: 35,
      rating: 3
    }
  ],
  DR0003: [
    {
      date: "4th Feb 2016",
      rider: "RD0066",
      cost: 5,
      rating: 5
    },
    {
      date: "5th Feb 2016",
      rider: "RD0003",
      cost: 50,
      rating: 2
    }
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      rider: "RD0022",
      cost: 5,
      rating: 5
    },
    {
      date: "4th Feb 2016",
      rider: "RD0022",
      cost: 10,
      rating: 4
    },
    {
      date: "5th Feb 2016",
      rider: "RD0073",
      cost: 20,
      rating: 5
    }
  ]
}

new_data = Hash.new

def find_driver_with_max (drivers, criteria)
  winner = nil
  winning_amount = 0
  drivers.each do |driver, data|
    amount = data[criteria]
    if amount > winning_amount
      winning_amount = amount
      winner = driver
    end
    # This doesn't catch ties!
  end
  return winner
end

ride_share.each do |driver, rides|
  # Make cost array for calculating amount made by each driver
  cost_array = rides.map {|ride| ride[:cost]}
  # Make rating array for calculating average rating for each driver
  rating_array = rides.map {|ride| ride[:rating]}
  average_rating = rating_array.sum / rides.length.to_f
  
  # Calculate most lucrative day (must combine dates first)
  combine_repeat_dates = Hash.new
  rides.each do |ride|
    if combine_repeat_dates.has_key?(ride[:date])
      combine_repeat_dates[ride[:date]] += (ride[:cost])
    else
      combine_repeat_dates[ride[:date]] = (ride[:cost])
    end
  end
  most_made_in_a_day = combine_repeat_dates.values.max
  most_lucrative_date = combine_repeat_dates.key(most_made_in_a_day)
  
  # Store new data in a hash of hashes
  new_data[driver] = {
    total_moolah: cost_array.sum,
    average_rating: average_rating
  }
  
  # Output info for each driver
  puts "Driver #{driver.slice(5)} has given #{rides.length} rides and earned an average rating of #{average_rating}.
  They made $#{cost_array.sum} in total. Their most lucrative day was #{most_lucrative_date} on which they made $#{most_made_in_a_day}."
end

# Determine which driver made the most money and which had the highest avg rating
richest_driver = find_driver_with_max(new_data, :total_moolah)
best_driver = find_driver_with_max(new_data, :average_rating)

# Output overall stats info
puts "The driver who made the most money is Driver #{richest_driver.slice(5)}!"
puts "The driver with the highest average rating is Driver #{best_driver.slice(5)}!"
