# A program that uses rideshare information to provide aggregated metrics
# 8/11/19
# Hallie Johnson

require 'colorize'

drivers = [
  {
    id: "DR0001",
    ride_date: ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"],
    cost: [10, 30, 45],
    rider: ["RD0003", "RD0015", "RD0003"],
    rating: [3, 4, 2]
  },
  {
    id: "DR0002",
    ride_date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [25, 15, 35],
    rider: ["RD0073", "RD0013", "RD0066"],
    rating: [5, 1, 3]
  },
  {
    id: "DR0003",
    ride_date: ["4th Feb 2016", "5th Feb 2016"],
    cost: [5, 50],
    rider: ["RD0066", "RD0003"],
    rating: [5, 2]
  },
  {
    id: "DR0004",
    ride_date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [5, 10, 20],
    rider: ["RD0022", "RD0022", "RD0073"],
    rating: [5, 4, 5]
  },
]

# METHODS
def average(array)
  return array.sum.to_f / array.length
end

# QUESTIONS / OUTPUT

puts "NUMBER OF RIDES BY DRIVER:".colorize(:yellow)
drivers.each do |i|
  puts "Driver #{i[:id]}: #{i[:ride_date].length}"
end

puts "\nTOTAL MONEY BY DRIVER:".colorize(:yellow)
drivers.each do |i|
  puts "Driver #{i[:id]}: $#{i[:cost].sum}"
end

puts "\nAVERAGE RATING BY DRIVER:".colorize(:yellow)
drivers.each do |i|
  puts "Driver #{i[:id]}: #{sprintf('%.1f', average(i[:rating]))}"
end

puts "\nTOP EARNING DRIVER:".colorize(:yellow)
money_array = drivers.map do |i|
  [i[:cost].sum, i[:id]]
end

puts "Driver #{money_array.max[1]}: $#{money_array.max[0]}"

puts "\nTOP RATED DRIVER:".colorize(:yellow)
ratings_array = drivers.map do |i|
  [average(i[:rating]), i[:id]]
end

puts "Driver #{ratings_array.max[1]}: #{sprintf('%.1f', ratings_array.max[0])}"

# BONUS: 
puts "\nDAY OF GREATEST EARNINGS BY DRIVER"

drivers.each do |i|
  new_array = i[:ride_date].zip(i[:cost]).sort
  
  top_day = ""
  top_dollar = 0
  
  new_array.each do |day|
    if day[0] == top_day
      top_dollar += day[1]
    elsif day[1] > top_dollar
      top_day = day[0]
      top_dollar = day[1]
    elsif day[1] == top_dollar
      top_day << " and #{day[0]}"
    end
  end
  
  puts "Driver #{i[:id]}'s top day was #{top_day} with $#{top_dollar} earned.'"
  
end
