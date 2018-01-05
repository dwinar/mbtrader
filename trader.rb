#!/usr/bin/env ruby
require 'csv'

class Trader
  def lookfor element, collection
    for item in collection
	  for j in item
	    return item if j == element
	  end
	end
  end
end

highscore = Array.new
cities = CSV.read('cities.txt')
goods = CSV.read('goods.txt')
t = Trader.new
homeTown = t.lookfor(goods[0][1], cities) # goods[0][1] is set arbitrally to hold source town's name
goods.delete_at 0

for goodie in goods
  y1 = homeTown[2].to_f
  x1 = homeTown[1].to_f
  
  city = t.lookfor(goodie[1], cities)
  
  x2 = city[1].to_f
  y2 = city[2].to_f
  
  distance = Math.sqrt((x2-x1)**2 + (y2-y1)**2)
  name = goodie[0]
  price = goodie[2].to_f
  qty = goodie[3].to_f
  
  score = ((qty * price) / distance)
  
  highscore.push([name, city[0], score.round(2), distance.round(2), price.round, qty.round])
end

pp (highscore.sort {|a,b| a[2] <=> b[2]}).reverse

# get cities and commodities through arguments
# search cities Array with arguments