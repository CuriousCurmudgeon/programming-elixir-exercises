defmodule Times do
    def double(n) do
        n * 2
    end

    # Exercise: ModulesAndFunctions-1
    def triple(n), do: n * 3

    # Exercise: ModulesAndFunctions-3
    def quadruple(n), do: Times.double(n) + Times.double(n)
end