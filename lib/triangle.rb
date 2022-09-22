class Triangle
  attr_accessor :side_one, :side_two, :side_three

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def kind 
    validate_triangle
    if side_one == side_two && side_two == side_three
      :equilateral
    elsif side_one == side_two || side_two == side_three || side_one == side_three
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [side_one, side_two, side_three].all?(&:positive?)
  end

  def valid_triangle_inequality?
    side_one + side_two > side_three && side_one + side_three > side_two && side_two + side_three > side_one
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end

  
end
