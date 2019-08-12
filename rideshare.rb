drivers = [
  {
    driver_ID: 'DR0001',
    rides: [
      {
        rider_ID: 'RD0003',
        date: '2/3/2016',
        cost: '10',
        rating: '3'
      },
      {   
        rider_ID: 'RD0015',
        date: '2/3/2016',
        cost: '30',
        rating: '4',
      },
      {
        rider_ID: 'RD0003',
        date: '2/5/2016',
        cost: '45',
        rating: '2'
      }
    ] 
  },
  {
    driver_ID: 'DR0002',
    rides: [
      {
        rider_ID: 'RD0073',
        date: '2/3/2016',
        cost: '25',
        rating: '5',
      },
      {
        rider_ID: 'RD0013',
        date: '2/4/2016',
        cost: '15',
        rating: '1'
      },
      {
        rider_ID: 'RD0066',
        date: '2/5/2016',
        cost: '35',
        rating: '3'
      }
    ]
  },
  {
    driver_ID: 'DR0003',
    rides: [
      {
        rider_ID: 'RD0066',
        date: '2/4/2016',
        cost: '5',
        rating: '5'
      },
      { 
        rider_ID: 'RD0003',
        date: '2/5/2016',
        cost: '50',
        rating: '2'
      }
    ],
  },
  {
    driver_ID: 'DR0004',
    rides: [
      {
        rider_ID: 'RD0022',
        date: '2/3/2016',
        cost: '5',
        rating: '5'
      },
      {
        rider_ID: 'RD0022',
        date: '2/4/2016',
        cost: '10',
        rating: '4'
      },
      { 
        rider_ID: 'RD0073',
        date: '2/5/2016',
        cost: '20',
        rating: '5'
      }
    ]
  }
]

total_rides = 0
total_profit = 0
total_ratings = 0
i = 0
profit_array = Array.new 
average_rating = Array.new 

drivers.each do |driver|
  driver[:rides].each do |one_ride|
    total_rides += 1
    total_profit += one_ride[:cost].to_i
    total_ratings += one_ride[:rating].to_f
  end 
  
  puts "Driver #{driver[:driver_ID]} has given #{total_rides} rides and has made $#{total_profit} with an average rating of %0.2f." % [total_ratings/total_rides]
  
  profit_array[i] = total_profit
  average_rating[i] = total_ratings/total_rides
  
  total_profit = 0
  total_rides = 0
  total_ratings = 0
  i += 1
end 

max_profit_driver = drivers[profit_array.index(profit_array.max)][:driver_ID]

puts "The driver with the most profits was #{max_profit_driver}."

max_average_rating_driver = drivers[average_rating.index(average_rating.max)][:driver_ID]

puts "The driver with the highest average rating was #{max_average_rating_driver}."
