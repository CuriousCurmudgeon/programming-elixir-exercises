defmodule MyList do

  # Exercise: ListsAndRecursion-5
  def all?([], _), do: true
  def all?([ head | tail ], func), do: func.(head) && all?(tail, func)

  def each([], _), do: :ok
  def each([ head | tail ], func), do: func.(head) && each(tail, func)

  def filter([], func), do: []
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
end
