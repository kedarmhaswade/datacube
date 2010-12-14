#!/usr/bin/env ruby

class DataCube
  # implements an n-dimensional data cube with each dimension having m elements
  # total number of elements is m**n, all elements are initialized in a one-dimensional array

  # n = #dimensions
  # m = #elements in each dimension
  def initialize(n, m)
    @n = n
    @m = m
    @array = []
    i = 0
    @limit = m**n
    while i < @limit
      @array << 0
      i += 1
    end
  end

  # accessor -- returns the element at [i, j, ..., n] where each of i, j, k is between 0 and m, (m exclusive)
  # (The parameter is an array of length n. Each element of this array must be between 0 and m, exclusive)
  def [](*params)
    @array[to_index(params)]
  end

  def []=(*iv)
    # make sure iv is an array with length n+1
    value = iv.pop
    @array[to_index(iv)] = value
  end

  def to_s
    @array.to_s
  end
  private
  
  def to_index(coefficients)
    n = coefficients.length
    i = n-1
    mega_index = 0
    while i >= 0
      mega_index = coefficients[i] + mega_index * n
      i -= 1
    end
    mega_index
  end
end
dc = DataCube.new(3, 5)
dc[0,1,2]=44
puts dc[0, 1, 2]
puts dc