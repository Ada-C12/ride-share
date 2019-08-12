# Ga-Young Jin, Cohort 12
# Wednesday, August 7th, 2019
# Week 1

rideshare_data = [
  [
    { driver: "DR0001",
      date: "3rd Feb 2016", 
      cost: 10, 
      rider: "RD0003", 
      rating: 3
    },
    { driver: "DR0001",
      date: "3rd Feb 2016", 
      cost: 30, 
      rider: "RD0015", 
      rating: 4
    },
    { driver: "DR0001",
      date: "5th Feb 2016", 
      cost: 45, 
      rider: "RD0003", 
      rating: 2
    }
  ],
  [
    { driver: "DR0002",
      date: "3rd Feb 2016", 
      cost: 25, 
      rider: "RD0073", 
      rating: 5
    },
    { driver: "DR0002",
      date: "4th Feb 2016", 
      cost: 15, 
      rider: "RD0013", 
      rating: 1
    },
    { driver: "DR0002",
      date: "5th Feb 2016", 
      cost: 35, 
      rider: "RD0066", 
      rating: 3
    },
  ],
  [
    { driver: "DR0003",
      date: "4th Feb 2016", 
      cost: 5, 
      rider: "RD0066", 
      rating: 5
    },
    { driver: "DR0003",
      date: "5th Feb 2016", 
      cost: 50, 
      rider: "RD0003", 
      rating: 2
    }
  ],
  [
    { driver: "DR0004",
      date: "3rd Feb 2016", 
      cost: 5, 
      rider: "RD0022", 
      rating: 5
    },
    { driver: "DR0004",
      date: "4th Feb 2016", 
      cost: 10, 
      rider: "RD0022", 
      rating: 4
    },
    { driver: "DR0004",
      date: "5th Feb 2016", 
      cost: 20, 
      rider: "RD0073", 
      rating: 5
    }
  ]
]

# number of drives each driver has given 
puts "Number of drives each driver has given:"
rideshare_data.each do |drives|
  puts "#{drives[0][:driver]}: #{drives.length}"
end

# total amount of money each driver has made
puts "Total amount of money each driver made:"
rideshare_data.each do |drives|
  total_money = 0
  drives.each do |price|
    total_money = total_money + price[:cost]
  end
  puts "#{drives[0][:driver]}: #{total_money}"
end

# average rating for each driver 
puts "The average rating for each driver:"
rideshare_data.each do |drives|
  total_rating = 0
  drives.each do |ride|
    total_rating = total_rating + ride[:rating]
  end
  avg_rating = total_rating / drives.length.to_f
  puts "#{drives[0][:driver]}: #{sprintf('%.2f', avg_rating)}"
end

# driver that made the most money 
most_money_driver = ""
money_made_array = Array.new
rideshare_data.each do |drives|
  money_made = 0
  drives.each do |ride|
    money_made = money_made + ride[:cost]
  end
  money_made_array << money_made
end 
most_money = 0
money_made_array.each do |total|
  if total > most_money
    most_money_driver = rideshare_data[0][0][:driver]
  end
end

puts "The driver that made the most money: #{most_money_driver}."

# driver that has the highest average rating
highest_avg_rating_driver = ""
rideshare_data.each do |drives|
  highest_avg_rating = 0
  avg_rating_array = Array.new
  total_rating = 0
  drives.each do |ride|
    total_rating = total_rating + ride[:rating]
  end 
  avg_rating_array << total_rating / drives.length.to_f
  total_rating = 0
  avg_rating_array.each do |avg|
    if avg > highest_avg_rating
      highest_avg_rating_driver = drives[0][:driver]
    end
  end
end 

puts "The driver with the highest average rating: #{highest_avg_rating_driver}."



