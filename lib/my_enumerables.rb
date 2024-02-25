module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_select
    arr = []
    self.my_each { |item| arr << item if yield(item) }
    arr
  end

  def my_all?
    self.my_each { |item| return false unless yield(item) }
    true
  end

  def my_any?
    self.my_each { |item|  return true if yield(item) }
    false
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
      return true if [nil, false].include?(yield(item))
    end
    false
  end

  def my_count
    count = 0
    if block_given?
      self.my_each { |item| count += 1 if yield(item) }
      return count
    end
    self.my_each { |item| count += 1}
    count
  end

  def my_map
    map = []
    self.each { |item| map << yield(item) }
    map
  end

  def my_inject(arg)
    temp = arg
    self.each { |item| temp = yield(temp, item) }
    temp
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield(i)
    end
  end
end