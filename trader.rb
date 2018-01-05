#!/usr/bin/env ruby
require 'csv'

class Trader
  def lookfor element, collection
    for c in collection
	  return c if c[0] == element
	end
  end
end

cities = CSV.read('cities.txt')
goods = CSV.read('goods.txt')
t = Trader.new
homeTown = t.lookfor goods[0][1], cities # goods[0][1] is seto arbitrally to hold source town's name
goods.delete_at 0

for goodie in goods
  y1 = homeTown[2].to_i
  x1 = homeTown[1].to_i
  
  city = t.lookfor(goodie[1], cities)
  
  x2 = city[1].to_i
  y2 = city[2].to_i
  
  distance = Math.sqrt((x2-x1)**2 + (y2-y1)**2)
  puts distance
end

# puts "#{x2} - #{x1} = #{x2-x1}"
# puts "#{y2} - #{y1} = #{y2-y1}"
# puts "#{(x2-x1)**2} + #{(y2-y1)**2} = #{(x2-x1)**2 + (y2-y1)**2}"
# puts "sqrt = #{Math.sqrt((x2-x1)**2 + (y2-y1)**2)}"

# get cities and commodities through arguments
# search cities Array with arguments