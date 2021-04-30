defmodule Math do
  # Exercise: ListsAndRecursion-0
  def sum([]),              do: 0
  def sum([ head | tail ]), do: sum(tail) + head

  # Exercise: ListsAndRecursion-1
  def mapsum(list, func) do
    map(list, func)
    |> sum
  end

  def map([], _func),             do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]
end
