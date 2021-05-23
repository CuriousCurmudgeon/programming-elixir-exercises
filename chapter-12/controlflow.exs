defmodule ControlFlow do
  # Exercise: ControlFlow-1
  def fizzbuzz(n) do
    is_divisible_by_three = rem(n, 3) == 0
    is_divisible_by_five = rem(n, 5) == 0
    case [ is_divisible_by_three, is_divisible_by_five ] do
      [ true, true ] -> "FizzBuzz"
      [ true, false ] -> "Fizz"
      [ false, true ] -> "Buzz"
      [ false, false ] -> n
    end
  end
end
