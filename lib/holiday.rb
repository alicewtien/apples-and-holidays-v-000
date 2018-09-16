require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |seasons, holidays_in_season|
    if seasons == :winter
      holidays_in_season.each do |holiday, supplies|
        supplies << supply
      end
    end
  end
  holiday_hash[:winter]
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |seasons, holidays_in_season|
    holidays_in_season.each do |holiday, supplies|
      if holiday == :memorial_day
        supplies << supply
      end
    end
  end
  holiday_hash[:spring]
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten

end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |seasons, holidays_in_season|
    puts "#{seasons}:".to_s.capitalize!
    holidays_in_season.each do |holiday, supplies|
      if holiday.to_s.split("_").size > 1
        holiday.to_s.split("_").each do |word|
          holiday = word.capitalize
          puts "  #{holiday}: #{supplies.join(", ")}"
        end
      else
        puts "  #{holiday.to_s.capitalize}: #{supplies.join(", ")}"
      end
    end
  end
end
# iterate through holiday_hash and print items such that your readout resembles:
# Winter:
#   Christmas: Lights, Wreath
#   New Years: Party Hats
# Summer:
#   Fourth Of July: Fireworks, BBQ
# etc.


def all_holidays_with_bbq(holiday_hash)
bbq_holidays = []
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.each do |seaons, holidays_in_season|
    holidays_in_season.each do |holiday, supplies|
      if supplies.include?("BBQ")
        bbq_holidays << holiday
      end
    end
  end
bbq_holidays
end
