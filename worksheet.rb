## Variables

# data from all rides.
all_rides = {
  "DR0001" => {
    "3rd Feb 2016" => [
      {
        :cost => 10,
        :rider => "RD0003",
        :rating => 3,
      },
      {
        :cost => 30,
        :rider => "RD0015",
        :rating => 4,
      }
    ],
    "4th Feb 2016" => [],
    "5th Feb 2016" => [
      {
        :cost => 45,
        :rider => "RD0003",
        :rating => 2,
      }
    ]
  },
  "DR0002" => {
    "3rd Feb 2016" => [
      {
        :cost => 25,
        :rider => "RD0073",
        :rating => 5,
      }
    ],
    "4th Feb 2016" => [
      {
        :cost => 15,
        :rider => "RD0013",
        :rating => 1,
      }
    ],
    "5th Feb 2016" => [
      {
        :cost => 35,
        :rider => "RD0066",
        :rating => 3,
      }
    ]
  },
  "DR0003" => {
    "3rd Feb 2016" => [],
    "4th Feb 2016" => [
      {
        :cost => 5,
        :rider => "RD0066",
        :rating => 5,
      }
    ],
    "5th Feb 2016" => [
      {
        :cost => 50,
        :rider => "RD0003",
        :rating => 2,
      }
    ]
  },
  "DR0004" => {
    "3rd Feb 2016" => [
      {
        :cost => 5,
        :rider => "RD0022",
        :rating => 5,
      }
    ],
    "4th Feb 2016" => [
      {
        :cost => 10,
        :rider => "RD0022",
        :rating => 4,
      }
    ],
    "5th Feb 2016" => [
      {
        :cost => 20,
        :rider => "RD0073",
        :rating => 5,
      }
    ]
  }
}

# make hash for just drivers.
all_driver_data = {}

# output message.
message_to_user = ""

## Methods

# build hash of just drivers.
def build_driver_hash(all_rides, all_drivers)
  all_rides.each_pair do |driver, data|
    all_drivers[driver] = 0
  end
  return all_drivers
end

# find the total number of something for each driver.
def total_up_items(list, list_per_driver, item)
  list.each_pair do |driver, dates_subhash|
    if list_per_driver[driver] == 0
      list_per_driver[driver] = {}
    end
    list_per_driver[driver][item] = 0
    
    if item == :rides
      dates_subhash.each_pair do |date, trips_subarray|
        list_per_driver[driver][item] += trips_subarray.length
      end
    else
      dates_subhash.each_pair do |date, trips_subarray|
        trips_subarray.each do |one_trip|
          list_per_driver[driver][item] += one_trip[item]
        end
      end
    end

  end
  return list_per_driver
end

# totals up the cost for each day for each driver.
def total_up_items_per_day(list, list_per_driver, item, item_per_day)
  list.each_pair do |driver, dates_subhash|
    
    if list_per_driver[driver] == 0
      list_per_driver[driver] = {}
    end
    list_per_driver[driver][item_per_day] = {}
    
    dates_subhash.each_pair do |date, trips_subarray|
      if list_per_driver[driver][item_per_day][date] == nil
        list_per_driver[driver][item_per_day][date] = 0
      end
      trips_subarray.each do |one_trip|
        list_per_driver[driver][item_per_day][date] += one_trip[item]
      end
    end
    
  end
  return list_per_driver
end

# find the average of some piece of drivers' data.
def find_average_per_driver(driver_data, num, num_of_components)
  driver_data.each_pair do |driver, data|
    data[num] = (data[num] / data[num_of_components])
  end
  return driver_data
end

# # find the max of a piece of drivers' data.
def find_max(data, item)
  max = 0
  data.each_pair do |driver, data|
    if data[item] > max
      max = data[item]
    end
  end
  return max
end

# find a list of drivers who earned that maximum.
def identify_key_of_num(data, num, max_type)
  keys_of_num = []
  data.each_pair do |driver, data|
    if data[max_type] == num
      keys_of_num.push(driver)
    end
  end
  return keys_of_num
end

# for each driver, find that driver's maximum cost.
def find_max_cost(all_data)
  all_data.each_pair do |driver, data|
    
    data[:max_cost] = 0
    data[:max_cost_day] = {}
    
    # find max cost before populating the list of days
    # which have that max cost
    data[:cost_per_day].each_pair do |date_of_year, cost_per_day|
      if cost_per_day > data[:max_cost]
        data[:max_cost] = cost_per_day
      end
    end
    data[:cost_per_day].each_pair do |date_of_year, cost_per_day|
      if cost_per_day == data[:max_cost] 
        data[:max_cost_day][date_of_year] = cost_per_day
      end
    end
    
  end
  return all_data
end

# lists out a given driver's stats on a piece of data.
# (used in Output to Console section.)
def make_item_per_driver_message(all_data, symbol = "", item)
  item_per_driver = ""
  count_token = 0
  all_data.each_pair do |driver, data|
    item_per_driver << "  #{count_token + 1}. #{driver}: #{symbol}#{data[item]}\n"
    count_token += 1
  end
  return item_per_driver
end

# lists out a given driver's maximum sales day.
# (used in Output to Console section.)
def make_max_per_driver_message(all_data)
  item_per_driver = ""
  count_token = 0
  all_data.each_pair do |driver, data|
    item_per_driver << "  #{driver} made"
    data.each_pair do |data_name, data_value|
      if data_name == :max_cost_day
        data_value.each_pair do |date, max|
          item_per_driver << " $#{max} on #{date}\n"
        end
      end
    end
  end
  return item_per_driver
end

## Main Code

# build list of just the drivers.
all_driver_data = build_driver_hash(all_rides, all_driver_data)

# add up each drivers' rides.
all_driver_data = total_up_items(all_rides, all_driver_data, :rides)

# adds up each drivers' fare.
all_driver_data = total_up_items(all_rides, all_driver_data, :cost)

# adds up each drivers' rating.
all_driver_data = total_up_items(all_rides, all_driver_data, :rating)
# calculates average rating for each drivers' rating.
all_driver_data = find_average_per_driver(all_driver_data, :rating, :rides)

# find the maximum fare earned among all drivers.
max_cost = find_max(all_driver_data, :cost)
# find a list of drivers who earned that maximum fare.
max_cost_earners = identify_key_of_num(all_driver_data, max_cost, :cost)

# find the maximum average rating earned among all drivers.
max_average_rating = find_max(all_driver_data, :rating)
# find a list of drivers who earned that maximum rating.
max_rating_earners = identify_key_of_num(all_driver_data, max_average_rating, :rating)

# totals up the cost for each day for each driver.
all_driver_data = total_up_items_per_day(all_rides, all_driver_data, :cost, :cost_per_day)

# for each driver, find that driver's maximum cost per day
# and find what days have that maximum cost
all_driver_data = find_max_cost(all_driver_data)

## Output to Console

# - the number of rides each driver has given
message_to_user << "The total number of rides each driver has given: \n"
num_rides_per_driver = make_item_per_driver_message(all_driver_data, :rides)
message_to_user << num_rides_per_driver

# - the total amount of money each driver has made
message_to_user << "The total amount of money each driver has made: \n"
total_money_per_driver = make_item_per_driver_message(all_driver_data, "$", :cost)
message_to_user << total_money_per_driver

# - the average rating for each driver
message_to_user << "The average rating for each driver: \n"
average_rating_per_driver = make_item_per_driver_message(all_driver_data, :rating)
message_to_user << average_rating_per_driver

# - Which driver made the most money?
message_to_user << "Which driver made the most money: \n  "
driver_who_made_the_most =  max_cost_earners.join(' and ')
driver_who_made_the_most << " earned the most money."
if max_cost_earners.length > 1
  driver_who_made_the_most << " \n  They"
else
  driver_who_made_the_most << " \n  #{max_cost_earners[0]}"
end
driver_who_made_the_most << " earned $#{all_driver_data[max_cost_earners[0]][:cost]}."
message_to_user << driver_who_made_the_most

# - Which driver has the highest average rating?
message_to_user << "\nWhich driver had the highest average rating: \n  "
driver_with_highest_average_rating = max_rating_earners.join(' and ')
driver_with_highest_average_rating << " had the highest average rating."
if max_rating_earners.length > 1
  driver_with_highest_average_rating << " \n  They"
else
  driver_with_highest_average_rating << " \n  #{max_rating_earners[0]}"
end
driver_with_highest_average_rating << " earned an average rating of #{all_driver_data[max_rating_earners[0]][:rating]}."
message_to_user << driver_with_highest_average_rating

# list out the max cost day for each driver using make_item_per_driver_message
max_pay_day_per_driver = "\nFor each driver, on which day did they make the most money?\n"
max_pay_day_per_driver << make_max_per_driver_message(all_driver_data)
message_to_user << max_pay_day_per_driver

puts message_to_user
