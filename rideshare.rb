def find_largest_value(hash)
  hash.max_by { |k, v| v }
end

drivers_info = {
  DR0001: [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: :RD0003,
      rating: 3,
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: :RD0015,
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: :RD0003,
      rating: 2,
    },
  ],
  DR0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: :RD0073,
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: :RD0013,
      rating: 1,
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: :RD0066,
      rating: 3,
    },
  ],
  DR0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: :RD0066,
      rating: 5,
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: :RD0003,
      rating: 2,
    },
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: :RD0022,
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: :RD0022,
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: :RD0073,
      rating: 5,
    },
  ],
}

d = 0
total_earned = {}
each_avg_rating = {}

drivers_info.keys.each_with_index do |driver, index|
  puts "\n===Driver #{drivers_info.keys[d]}==="
  puts "Total rides during the week: #{drivers_info[driver].length}"

  d += 1
  total_money = 0
  rating_total = 0

  drivers_info[driver].map do |ride|
    each_days_total = ride[:cost]
    total_money += each_days_total

    each_rides_rating = ride[:rating]
    rating_total += each_rides_rating.to_f

    total_earned[driver] = total_money
    each_avg_rating[driver] = rating_total / drivers_info[driver].length
  end

  # Find each driver's most profitable day
  day_with_most_money = drivers_info[driver].max_by { |k| k[:cost] }
  puts "Most profitable day: #{day_with_most_money[:date]} with $#{"%.2f" % day_with_most_money[:cost].to_f}"

  # Prints total money each driver made during the week
  puts "Total amount of money during the week: $#{"%.2f" % total_money.to_f}"

  avg_rating = rating_total / drivers_info[driver].length
  puts "Average rating: #{"%.2f" % avg_rating.to_f}"
end

puts "\n===RESULTS==="

driver_with_most_money = find_largest_value(total_earned)
puts "\nDriver #{driver_with_most_money[0]} made the most money with $#{"%.2f" % driver_with_most_money[-1].to_f}"

highest_rated_driver = find_largest_value(each_avg_rating)
puts "\nDriver #{highest_rated_driver[0]} has the highest average rating with #{"%.2f" % highest_rated_driver[-1].to_f}"
