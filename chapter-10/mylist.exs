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

  # Exercise: ListsAndRecursion-8
  # orders = [
  #   [id: 123, ship_to: :NC, net_amount: 100.00],
  #   [id: 124, ship_to: :OK, net_amount:  35.50],
  #   [id: 125, ship_to: :TX, net_amount:  24.00],
  #   [id: 126, ship_to: :TX, net_amount:  44.80],
  #   [id: 127, ship_to: :NC, net_amount:  25.00],
  #   [id: 128, ship_to: :MA, net_amount:  10.00],
  #   [id: 129, ship_to: :CA, net_amount: 102.00],
  #   [id: 130, ship_to: :NC, net_amount:  50.00],
  # ]
  # tax_rates = [NC: 0.075, TX: 0.08]
  def calculate_total(orders, tax_rates) do
    # for order <- orders, tax_rate <- tax_rates, Keyword.has_key?(tax_rates, order[:ship_to]), do: Keyword.put(order, :total_amount, order[:net_amount] * tax_rates[order[:ship_to]])
    for order <- orders do
      net_amount = order[:net_amount]
      ship_to = order[:ship_to]

      tax_rate = Keyword.get(tax_rates, ship_to, 0)

      order ++ [total_amount: net_amount + (net_amount * tax_rate)]
    end
  end
end
