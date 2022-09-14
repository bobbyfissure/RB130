#Easy I

#1


# class Tree
#   include Enumerable

#   def each(arr)
#     counter = 0

#     while counter < arr.size do 
#       yield(arr[counter])
#       counter += 1
#     end

#     arr
#   end

# end

# #2

# # def compute
# #   if block_given?
# #     yield
# #   else
# #     "Does not compute."
# #   end
# # end

# # def compute
# #   return "Does not compute." unless block_given?
# #   yield
# # end

# #3

# def missing(arr)
#   result = []
  
#   arr.each_with_index do |num, index|
#     break if index == arr.size - 1
#     cur = num 
#     while arr[index + 1] - cur > 1 do
#       cur = cur + 1
#       result << cur
#     end
#   end

#   result
# end

# #4

# def divisors(num)
#   result = [1]
#   return result if num == 1

#   half = num/2 
#   2.upto(half) do |i|
#     result << i if num % i == 0
#   end

#   result << num
#   result
# end

# #5

# def rot13(message)
#   result = ""

#   message.chars.each do |char|
#    if ("a".."m").include?(char) || ("A".."M").include?(char)
#     converted_char = (char.ord + 13).chr 
#     result << converted_char
#    elsif ("n".."z").include?(char) || ("N".."Z").include?(char)
#     converted_char = (char.ord - 13).chr
#     result << converted_char 
#    else 
#     result << char
#    end
#   end
#   result

# end

# rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")

# #6

# def any?(arr)
#   counter = 0
#   result = false

#   while counter < arr.size do 
#     if yield(arr[counter])
#       result = true
#       break
#     else
#       counter += 1
#     end
#   end
#   result
# end

# # p any?([1, 3, 5, 6]) { |value| value.even? } == true
# # p any?([1, 3, 5, 7]) { |value| value.even? } == false
# # p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# # p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# # p any?([1, 3, 5, 7]) { |value| true } == true
# # p any?([1, 3, 5, 7]) { |value| false } == false
# # p any?([]) { |value| true } == false

# #7

# def all?(arr)
#   arr.each { |element| return false if !yield(element)}
#   true
# end

# # p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# # p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# # p all?([2, 4, 6, 8]) { |value| value.even? } == true
# # p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# # p all?([1, 3, 5, 7]) { |value| true } == true
# # all?([1, 3, 5, 7]) { |value| false } == false
# # all?([]) { |value| false } == true

# #8

# def none?(arr)
#   return true if arr.size == 0
#   arr.each { |element| return false if yield(element)}
#   true
# end


# # p none?([1, 3, 5, 6]) { |value| value.even? } == false
# # p none?([1, 3, 5, 7]) { |value| value.even? } == true
# # p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# # p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# # p none?([1, 3, 5, 7]) { |value| true } == false
# # p none?([1, 3, 5, 7]) { |value| false } == true
# # p none?([]) { |value| true } == true

# #9

# def one?(arr)
#   return false if arr.size == 0
  
#   counter = 0

#   arr.each do |element|
#     break if counter > 1
#     counter += 1 if yield(element)
#   end

#   counter == 1
# end


# # p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# # p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# # p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# # p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# # p one?([1, 3, 5, 7]) { |value| true }           # -> false
# # p one?([1, 3, 5, 7]) { |value| false }          # -> false
# # p one?([]) { |value| true } 

# #10

# def count(arr)
#   counter = 0

#   arr.each do |element|
#     counter += 1 if yield(element)
#   end
#   counter
# end

# # p count([1,2,3,4,5]) { |value| value.odd? } == 3
# # p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# # p count([1,2,3,4,5]) { |value| true } == 5
# # p count([1,2,3,4,5]) { |value| false } == 0
# # p count([]) { |value| value.even? } == 0
# # p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# #Easy II

# #1

# def step(lower_bound, upper_bound, increment)
#   range = (lower_bound..upper_bound).to_a
#   counter = 0
#   while counter < range.size do
#     yield(range[counter])
#     counter += increment
#   end
  
# end

# #2

# def zip(arr1, arr2)
#   result = []

#   arr1.each_with_index do |elem, idx|
#     sub_array = []
#     sub_array << arr1[idx]
#     sub_array << arr2[idx]
#     result << sub_array
#   end
#   result
# end

# #3

# def map(arr)
#   return [] if arr.size == 0
#   result = []

#   arr.each do |element|
#     result << yield(element)
#   end
  
#   result
# end

# #4

# def count(*others)
#   arr = *others.to_a
#   counter = 0

#   arr.each {|elem| counter += 1 if yield(elem)}

#   counter
# end


# #5

# def drop_while(arr)
#   first_falsy_idx = nil
#   arr.each_with_index do |elem, idx|
#     if !yield(elem)
#       first_falsy_idx = idx 
#       break
#     end
#   end
#   first_falsy_idx ? arr.slice(first_falsy_idx..-1) : []
# end


# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []

#6


# def each_with_index(arr)
#   counter = 0
#   while counter < arr.size
#     yield(arr[counter], counter)
#     counter += 1
#   end
# end

# #7

# def each_with_object(arr, obj)
#   arr.each do |elem|
#     yield(elem, obj)
#   end
#   obj
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result 

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

#8

# def max_by(arr)
#   max = arr.first 
#   arr.each do |elem|
#     max = elem if yield(elem) > yield(max)
#   end
#   max
# end

# #9

# def each_cons(arr)
#   arr.each_with_index do |elem, index|
#     yield(arr[index], arr[index + 1]) if index + 1 < arr.size
#   end
#   nil
# end


# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# result == nil

#10

# def each_cons(arr, n)
#   arr.each_index do |index|
#     break if index + n - 1 >= arr.size
#     yield(*arr[index..(index + n - 1)])
    
#   end
# end

#Easy Testing I

#1

# require 'minitest/autorun'

# class FirstTest < MiniTest::Test 
#   def test_odd?(value)
#     assert(value.odd?, "value is not odd")
#   end
# end

# #2

# require 'minitest/autorun'

# class SecondTest < MiniTest::Test 
#   def test_downcase(value)
#     assert_equals('xyz', value.downcase)
#   end
# end


# #3

# require 'minitest/autorun'

# class ThirdTest < MiniTest::Test 
#   def test_nil?(value)
#     assert_nil(value)
#   end
# end

# #4

# require 'minitest/autorun'

# class FourTest < MiniTest::Test
#   def test_empty(list)
#     assert_equal(0, list.size)
#     assert(list.empty?)
#     assert_empty(list)
#   end
# end

#5

# require 'minitest/autorun'

# class FifthTest < MiniTest::Test 
#   def test_include(list)
#     assert_include(list, 'xyz')
#   end
# end

# #6

# require 'minitest/autorun'

# require_relative 'employee.rb'

# class SixthTest < MiniTest::Test 
#   def test_employee
#     assert_raises NoExperienceError do
#       employee.hire
#     end
#   end
# end

# #7

# require 'minitest/autorun'

# class SeventhTest < MiniTest::Test 
#   def test_numeric(value)
#     assert_instance_of Numeric, value
#   end
# end

#8

# require "minitest/autorun"

# class EigthTest < MiniTest::Test
#   def test_subclasses(value)
#     assert_kind_of Numeric, value
#   end
# end

#9

# require 'minitest/autorun'

# class NinthTest < MiniTest::Test 
#   def test_same_object(list)
#     assert_same list, list.process
#   end
# end

#10

# refute_includes list, 'xyz'

#Medium I

#1

# class Device
#   #attr_accessor :recordings
  
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     record(yield) if block_given?
#   end

#   def play
#     @recordings.each do |recording|
#       puts recording
#     end
#   end
# end


# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

#2

# class TextAnalyzer
#   attr_reader :file, :file_data
  
#   def initialize
#     @file = File.open("sample_text.txt")
#     @file_data = file.read 
#   end 
  
#   def process
#     yield(file_data) if block_given?
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts text.split("\n\n").size } #paragraphs
# analyzer.process { |text| puts text.split("\n").size } #lines
# analyzer.process { |text| puts text.split.size } #words

#3


# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(things)
#   puts "Let's start gathering food."
#   yield(things)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) { puts "#{items.join(', ')}"}


#4

# def parallel_assignment(arr)
#   yield(arr)
# end

# parallel_assignment do |_, _, *raptors|
#   puts "Raptors: #{raptors.join(",")}"
# end


#5

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end


# gather(items) do |*first ,last |
#   puts "#{first.join(", ")}"
#   puts "#{last}"
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# gather(items) do |first ,*middle ,last |
#   puts "#{first}"
#   puts "#{middle.join(", ")}"
#   puts "#{last}"
# end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# gather(items) do | first, *last |
#   puts "#{first}"
#   puts "#{last.join(", ")}"
# end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# gather(items) do |apples,corn ,cabbage ,wheat |
#   puts "#{apples} #{corn} #{cabbage} #{wheat}"
# end


# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

#6

# # Replace the two `method_name` placeholders with actual method calls
# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# #Replace `argument` with the correct argument below
# # `method` is `Object#method`, not a placeholder
# base8_proc = method(:convert_to_base_8).to_proc

# # We'll need a Proc object to make this code work
# # Replace `a_proc` with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# # #correct answer: [10, 12, 14, 16, 20, 41]

#7

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     if block_given?
#       1.upto(array.size - 1) do |index|
#         next if yield(array[index - 1], array[index])
#         array[index - 1], array[index] = array[index], array[index - 1]
#         swapped = true
#       end
#     else
#       1.upto(array.size - 1) do |index|
#         next if array[index - 1] <= array[index]
#         array[index - 1], array[index] = array[index], array[index - 1]
#         swapped = true
#       end
#     end

#     break unless swapped
#   end
#   nil
# end


# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)





