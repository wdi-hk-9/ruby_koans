require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the triangle method in the file 'triangle.rb'
require './triangle.rb'

class AboutTriangleProject2 < Neo::Koan
  # The first assignment did not talk about how to handle errors.
  # Let's handle that part now.
  def test_illegal_triangles_throw_exceptions
    assert_raise(TriangleError) do triangle(0, 0, 0) end
    assert_raise(TriangleError) do triangle(3, 4, -5) end
    assert_raise(TriangleError) do triangle(1, 1, 3) end
    assert_raise(TriangleError) do triangle(2, 4, 2) end
    # HINT: for tips, see http://stackoverflow.com/questions/3834203/ruby-koan-151-raising-exceptions

  end
end

def triangle(a, b, c)
  s = (a + b + c) / 2.0
  # the following must be positive to be a valid triangle
  valid_triangle = (s - a) * (s - b) * (s - c)

  if a <= 0 || b <= 0 || c <= 0 || valid_triangle <= 0 then
    raise TriangleError
  elsif a == b && b == c then
    :equilateral
  elsif a == c || a == b || b == c then
    :isosceles
  else
    :scalene
  end
end

class TriangleError < StandardError
end


