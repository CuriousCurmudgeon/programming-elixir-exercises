defmodule Math do
  # Exercise: ListsAndRecursion-0
  def sum([]), do: 0
  def sum([head | tail]), do: sum(tail) + head
end
