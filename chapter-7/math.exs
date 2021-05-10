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

  # Exercise: ListsAndRecursion-3
  # The behavior here is slightly different than what the book shows. Not sure if this
  # is because of me using a newer version of Elixir or not.
  def caesar([], _), do: []
  def caesar([ head | tail ], n), do: [ rem(head + n, ?z) | caesar(tail, n) ]

  # Exercise: ListsAndRecursion-4
  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from + 1, to)]
end
