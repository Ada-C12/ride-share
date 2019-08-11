drivers = [
  {
    id: "DR0001",
    trips: 
    [
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
        rating: 3
      },
      {
        date: "5th Feb 2016",
        cost: 45,
        rider_id: "RD0003",
        rating: 2
      }
    ]
  },
  {
    id: "DR0002",
    trips:
    [
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
    ]
  },
  {
    id: "DR0003",
    trips:
    [
      {
        date: "4th Feb 2016",
        cost: 5,
        rider_id: "RD0003",
        rating: 5
      },
      {
        date: "5th Feb 2016",
        cost: 50,
        rider_id: "RD0003",
        rating: 2
      }
    ]
  },
  {
    id: "DR0004", 
    trips: 
    [
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
]


puts "Number of rides each driver has given:"
drivers.each do |driver|
  puts "#{driver[:id]}: #{driver[:trips].length} trips"
end  


puts "Total money each driver has made:"
drivers.each do |driver| 
  total_cost = driver[:trips].map do |trip|
    trip[:cost]
  end
  driver[:total_cost] = total_cost.sum
  puts "#{driver[:id]}: $#{driver[:total_cost]}"
end


puts "Average rating for each driver:"
drivers.each do |driver|
  ratings = driver[:trips].map do |trip|
    trip[:rating].to_f
  end
  driver[:avg_rating] = (ratings.sum / ratings.length).round(1)
  puts "#{driver[:id]}: #{driver[:avg_rating]}"
end


richest_driver = drivers.max_by do |driver|
  driver[:total_cost]
end
puts "The driver who made the most money is #{richest_driver[:id]}."


highest_rated_driver = drivers.max_by do |driver|
  driver[:avg_rating]
end
puts "The driver with the highest average rating is #{highest_rated_driver[:id]}."


drivers.each do |driver|
  trips_by_cost = driver[:trips].sort_by do |trip|
    trip[:cost]
  end
  puts "Driver #{driver[:id]} made the most money on #{trips_by_cost.last[:date]}."
end
