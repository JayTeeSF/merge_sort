#!/usr/bin/env ruby

module Sorter
  extend self

  def sort(list=[])
    puts "sorting: #{list.inspect}"
    gets
    list_size = list.size
    return list if list_size <= 1
    puts "still going"

    half = list_size/2
    if 2 == list_size
      beginning = [list[0]]
      ending = [list[1]]
    else
      beginning = list[0..(half -1)]
      ending = list[half..-1]
    end
    merge(sort(beginning), sort(ending))
  end

  def merge(a, b)
    result = [] 
    a_index = 0
    a_size = a.size
    b_index = 0
    b_size = b.size
    full_size = a_size + b_size
    0.upto(full_size - 1) do |e|
      if (a_index < a_size && ((b_index >= b_size) || (a[a_index] <= b[b_index]) ))
        result << a[a_index]
        a_index += 1
      else
        result << b[b_index]
        b_index += 1
      end
    end
    result
  end

end
puts Sorter.sort([5])
puts Sorter.sort([5,4,1,8,7,2,9,6,3])
