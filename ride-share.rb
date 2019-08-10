drivers = [
  { 
    id: "DR0001", 
    date: [ "3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016" ],
    cost: [ 10, 30, 45 ],
    rider_id: [ "RD0003", "RD0015", "RD0003"],
    rating: [ 3, 4, 2 ]
  },
  {
    id: "DR0002", 
    date: [ "3rd Feb 2016", "4th Feb 2016", "5th Feb 2016" ],
    cost: [ 25, 15, 35 ],
    rider_id: [ "RD0073", "RD0013", "RD0066" ],
    rating: [ 5, 1, 3 ]
  },
  {
   id: "DR0003",
    date: [ "4th Feb 2016", "5th Feb 2016" ],
    cost: [ 5, 50 ],
    rider_id: [ "RD0066", "RD0003" ],
    rating: [ 5, 2 ]
  },
  {
    id: "DR0004",
    date: [ "3rd Feb 2016", "4th Feb 2016", "5th Feb 2016" ],
    cost: [ 5, 10, 20 ],
    rider_id: [ "RD0022", "RD0022", "RD0073"],
    rating: [ 5, 4, 5 ]
  }
]

highest_earner = ""
highest_earned = 0

best_rated_driver = ""
top_rating = 0

drivers.each do | i |
  number_drives = i[:date].count
  total_earned = i[:cost].sum
  average_rating = i[:rating].sum.to_f/number_drives
  day = i[:date][i[:cost].index(i[:cost].max)]  
  puts "Driver Id #{i[:id]} has given #{number_drives} drives, earned in total $#{total_earned}, and has an average rating of #{sprintf('%.1f', average_rating)} stars. The best earning day was #{day}"

  if total_earned > highest_earned
    highest_earned = total_earned
    highest_earner = i[:id]
  end 

  if average_rating > top_rating
    top_rating = average_rating
    best_rated_driver = i[:id]
  end
end  

puts "The driver that made the most of the money was Id # #{highest_earner}"
puts "The driver with highest rating was #{best_rated_driver}"      
