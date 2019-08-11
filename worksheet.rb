# Comprehension Questions:
# Create a list of the layers you identify.
# -- drivers; rides: riders, date, cost, rating
# Which layers are nested in each other?
# -- riders, date, cost and rating are nested within rides; rides are nested within drivers
# -- the above nesting is maximized for comparing drivers, but in other cases one could organize by rider or date
# Which layers of data "have" within it a different layer?
# -- drivers (and rides); if organized differently, without drivers as the topmost layer, riders and date could have layers within them
# Which layers are "next" to each other?
# -- cost and rating both apply to specific rides, so are next to each other
# -- for the purposes of this exercise, date and rider are also next to cost and rating because I'm not prioritizing finding data among dates and riders

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

count = 1
most_moolah = 0
richest_driver = nil
highest_average = 0
best_driver = nil

ride_share.each do |key, value|
  # Calculate total money made and most lucrative day 
  total_moolah = 0
  most_lucrative_date = nil
  most_made_in_a_day = 0
  value.each do |hash|
    total_moolah += hash[:cost]
    if hash[:cost] > most_made_in_a_day
      most_made_in_a_day = hash[:cost]
      most_lucrative_date = hash[:date]
    end 
  end
  
  # Calculate average rating
  total_points = 0
  value.each do |hash|
    total_points += hash[:rating]
  end
  average = total_points / value.length.to_f
  
  # Output info for each driver
  puts "Driver #{count} has given #{value.length} rides and earned an average rating of #{average}. 
  They made $#{total_moolah} in total. Their most lucrative day was #{most_lucrative_date} on which they made $#{most_made_in_a_day}."
  
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
