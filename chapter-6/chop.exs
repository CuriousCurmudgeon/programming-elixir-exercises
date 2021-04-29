# Exercise: ModulesAndFunctions-6
defmodule Chop do
    def guess(actual, lower..upper) when actual in lower..upper do
        guess_helper(actual, lower..upper, div(upper - lower, 2) + lower)
    end

    def guess(actual, lower..upper) do
        IO.puts "Guess must be in the range"
    end

    defp guess_helper(actual, _lower.._upper, current) when actual == current do
        IO.puts current
    end

    defp guess_helper(actual, _lower..upper, current) when actual > current do
        print_is_it current
        guess_helper(actual, current..upper, div(upper - current, 2) + current)
    end

    defp guess_helper(actual, lower.._upper, current) when actual < current do
        print_is_it current
        guess_helper(actual, lower..current, div(current - lower, 2) + lower)
    end

    defp print_is_it(current), do: IO.puts "Is it #{current}"
end
