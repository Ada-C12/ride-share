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

# def find_most (array, key1, key2)
#   total = 0
#   most = nil 
#   array.each do
#     puts array[key1]
#     puts array[key2]
#     if [key1] > total
#       total = [key1]
#       most = [key2]
#     end
#   end 
#   return [total, most] 
# end 

count = 1
most_moolah = 0
richest_driver = nil
highest_average = 0
best_driver = nil

ride_share.each do |key, value|
  # Make cost array for calculating amount made by each driver
  cost_array = value.map {|hash| hash[:cost]}
  # Make rating array for alculating average rating for each driver
  rating_array = value.map {|hash| hash[:rating]}
  average_rating = rating_array.sum / value.length.to_f
  # Add these 
  value << {total_moolah: cost_array.sum, average_rating: average_rating} 
  p ride_share 
  
  # Calculate most lucrative day 
  
  # #  most_lucrative_date = nil
  # #  most_made_in_a_day = 0
  
  # most_lucrative_date = find_most(value, [:cost], [:date])[0]
  # most_made_in_a_day = value[:cost]
  # most_made_in_a_day = most_made_in_a_day.max
  # puts most_made_in_a_day
  # # ACCOUNT FOR DRIVERS W/ MULTIPLE RIDES ON ONE DAY
  
  
  # Output info for each driver
  puts "Driver #{count} has given #{value.length} rides and earned an average rating of #{average_rating}. 
  They made $#{cost_array.sum} in total. Their most lucrative day was #{most_lucrative_date} on which they made $#{most_made_in_a_day}."
  
  # Determine which driver made the most money
  if total_moolah > most_moolah
    most_moolah = total_moolah
    richest_driver = count
  end
  
  # Determine which driver had the highest average rating
  if average > highest_average
    highest_average = average
    best_driver = count 
  end 
  count += 1
end 

# Output overall stats info
puts "The driver who made the most money is Driver #{richest_driver}!"
puts "The driver with the highest average rating is Driver #{best_driver}!"
puts ride_share