defmodule MyList do

  # Exercise: ListsAndRecursion-5
  def all?([], _), do: true
  def all?([ head | tail ], func), do: func.(head) && all?(tail, func)

  def each([], _), do: :ok
  def each([ head | tail ], func), do: func.(head) && each(tail, func)

  def filter([], _), do: []
  def filter([ head | tail ], func) do
    if func.(head) do
      [head | func.(tail)]
    else
      [func.(tail)]
    end
  end

  # Only handles count >= 0
  def split(list, count), do: _split(count, [], list)
  defp _split(0, split_out, remaining), do: { split_out, remaining }
  defp _split(_, split_out, []), do: { split_out, [] }
  defp _split(count, split_out, [ head | tail ]), do: _split(count - 1, split_out ++ [head], tail)

  def take([], _), do: []
  def take(_, 0), do: []
  def take([ head | tail ], count), do: [ head | take(tail, count - 1)]

  # Exercise: ListsAndRecursion-6
  def flatten([]), do: []
  def flatten([ head | tail ]) when is_list(head), do: flatten(head) ++ flatten(tail)
  def flatten([ head | tail ]), do: [head] ++ flatten(tail)

  # Exercise: ListsAndRecursion-7
  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from + 1, to)]

  def primes(n) when n >= 2 do
    for x <- Math.span(2,n), Enum.all?(Math.span(2,x-1), &(rem(x,&1)!=0)), do: x
  end
end
