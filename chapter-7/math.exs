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

  # Exercise: ListsAndRecursion-2
  def max([ head | tail ]), do: _max(tail, head)

  defp _max([], current_max), do: current_max
  defp _max([ head | tail ], current_max) when head > current_max, do: _max(tail, head)
  defp _max([ head | tail ], current_max) when head <= current_max, do: _max(tail, current_max)
end
