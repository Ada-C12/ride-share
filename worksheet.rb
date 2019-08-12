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

def find_winner (hash, criteria)
  totals = {}
  hash.each do |key, value|
    totals[key] = value[-1][criteria]
  end
  winning_amount = totals.values.max
  winner = totals.key(winning_amount)
  return winner
end

ride_share.each do |key, value|
  # Make cost array for calculating amount made by each driver
  cost_array = value.map {|hash| hash[:cost]}
  # Make rating array for calculating average rating for each driver
  rating_array = value.map {|hash| hash[:rating]}
  average_rating = rating_array.sum / value.length.to_f
  
  # Calculate most lucrative day (must combine dates first)
  combine_repeat_dates = Hash.new
  value.each do |hash|
    if combine_repeat_dates.has_key?(hash[:date])
      combine_repeat_dates[hash[:date]] += (hash[:cost])
    else
      combine_repeat_dates[hash[:date]] = (hash[:cost])
    end
  end
  most_made_in_a_day = combine_repeat_dates.values.max
  most_lucrative_date = combine_repeat_dates.key(most_made_in_a_day)
  
  # Add new data to the array for each driver value
  value << {total_moolah: cost_array.sum, average_rating: average_rating}
  
  # Output info for each driver
  puts "Driver #{key.slice(5)} has given #{value.length-1} rides and earned an average rating of #{average_rating}.
  They made $#{cost_array.sum} in total. Their most lucrative day was #{most_lucrative_date} on which they made $#{most_made_in_a_day}."
end

# Determine which driver made the most money and which had the highest avg rating
richest_driver = find_winner(ride_share, :total_moolah)
best_driver = find_winner(ride_share, :average_rating)

# Output overall stats info
puts "The driver who made the most money is Driver #{richest_driver.slice(5)}!"
puts "The driver with the highest average rating is Driver #{best_driver.slice(5)}!"
