rides_by_driver_id = {  
  DR0004: [
    {
      date:"3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5,
    },
    { 
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5,
    }],  
  DR0001: [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3,
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2,
    }],
  DR0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1,
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3,
    }],
  DR0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5,
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2,
    }]
}

# The number of rides each driver has given

array_rides_by_driver_id = rides_by_driver_id.map do |driver_id, rides|
  {driver_id => rides.length} 
end

puts "The number of rides each driver has given: "

array_rides_by_driver_id.each do |total_rides_by_driver_id|
  total_rides_by_driver_id.each do |driver_id, rides|
    puts "#{driver_id}: #{rides}"
  end
end

# The total amount of money each driver has made

array_salary_by_driver_id = rides_by_driver_id.map do |driver_id, rides|
  {driver_id => rides.map do |ride|
    ride[:cost]
  end.sum}
end

puts "The total amount of money each driver has made: "

array_salary_by_driver_id.each do |salary_by_driver_id|
  salary_by_driver_id.each do |driver_id, salary|
    puts "#{driver_id}: #{salary}"
  end
end 

# The average rating for each driver

array_rating_by_driver_id = rides_by_driver_id.map do |driver_id, rides|
  {driver_id => rides.map do |ride|
    ride[:rating]
  end}
end

average_rating_by_driver_id = {}
array_rating_by_driver_id.each do |driver|
  driver.each do |driver_id, rating|
  average_rating_by_driver_id[driver_id] = ((rating.sum.to_f) / rating.length).round(2)
  end
end

puts "The average rating for each driver: "

average_rating_by_driver_id.each do |driver_id, average_rating|
  puts "#{driver_id}: #{average_rating}"
end

# Which driver made the most money?

richest_driver = array_salary_by_driver_id.max_by do |salary_by_driver_id|
  driver_id, salary = salary_by_driver_id.first
  salary
end

puts "The driver who made the most money is: #{richest_driver.first.first.to_s}"

# Which driver has the highest average rating?

best_driver = average_rating_by_driver_id.max_by do |driver_id, rating|
  rating
end

puts "The driver who has the highest average rating is #{best_driver.first}"
