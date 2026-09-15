#!/bin/ruby
print "hello world"
the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# this first kind of for-loop goes through a list in a more traditional
# style found in other languages
for number in the_count
  puts "This is count #{number}"
end

# same as above, but in a more Ruby style this and the next one are
# the preferred way Ruby for-loops are written
fruits.each do |fruit|
  puts "A fruit of type: #{fruit}"
end

list =  [9, 5, 3, 2, 7, 8, 1, 4]
list.each do |entry| 
	#puts entry
	print entry
end
puts
list.sort.each do |entry| 
	#puts entry
	print entry
end


# Levenshtein.distance_swap("sdfsdf", "sdfwesdf")
# uninitialized constant Levenshtein (NameError)

puts "Is it greater? #{5 > -2}"
["A", "B", "C"].each_with_index {|val, index| puts "#{val} => #{index}" }
