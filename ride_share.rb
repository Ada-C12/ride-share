# Ride Share Assignment 

hash = {
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
      date: "5th Feb 2016",
      cost: 20,
      rider: "RD0073",
      rating: 5
    }
  ]
}
#----------------------------------------------------------------------
puts "----Ride Share Program Summary----"

puts "\n1. How many rides did each driver give?"

hash.each do |driver, rides|
  puts "#{driver} gave #{rides.length} rides"
end

#----------------------------------------------------------------------
puts "\n2. How much money did each driver make?"

# a hash to store total income made by each driver
total_income_hash = {}

hash.each do |driver, rides|
  total = 0
  rides.each do |ride|
    cost = ride[:cost].to_f
    total += cost  
  end
# assign the total(value) to each corresponding driver(key)
  total_income_hash[driver] = total
  
  puts "#{driver} made $#{'%.02f' % total}"
end

#----------------------------------------------------------------------
puts "\n3. What was the average rating of each driver?"

# a hash to store average rating of each driver
average_rating_hash = {}

hash.each do |driver, rides|
  total = 0
  rides.each do |ride|
    rating = ride[:rating].to_i
    total += rating  
  end
  average_rating = (total / rides.length.to_f)
# will store the calculated average(value) to each correspoding driver(key)
  average_rating_hash[driver] = average_rating

  puts "#{driver} had an average rating of: #{'%.02f' % average_rating}"
end

#----------------------------------------------------------------------
puts "\n4.Which driver made the most money?"

driver_most_income = []
highest_income = 0

total_income_hash.each do |driver, income|
  if income > highest_income
    highest_income = income
    driver_most_income.clear()
    driver_most_income << driver
  elsif
    income == highest_income
    driver_most_income << driver
  end
end

puts driver_most_income.join(', ')

#----------------------------------------------------------------------
puts "\n5. Which driver had the highest average rating?"

driver_highest_rating = []
highest_average_rating = 0

average_rating_hash.each do |driver, average_rating|
  if average_rating > highest_average_rating
    highest_average_rating = highest_average_rating
    driver_highest_rating.clear()
    driver_highest_rating << driver
  elsif
    average_rating == highest_average_rating
    driver_highest_rating << driver
  end
end

puts driver_highest_rating.join(', ')

#----------------------------------------------------------------------
puts "\nOptional: For each driver, on which day did they make the most money?"

cost = 0
highest_cost_day = 0

hash.each do |driver, rides|
  rides.each do |ride|
    ride[:cost] > cost
    cost = ride[:cost]
    ride[:cost] = highest_cost_day
    highest_cost_day = ride[:date]
  end
  puts "#{driver} made most money on #{highest_cost_day}"
end

