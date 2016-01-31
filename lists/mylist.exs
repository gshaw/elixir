defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  # E.g., MyList.map([4, 77, 3], fn(n) -> n * n * n end)
  # or    MyList.map([4, 77, 3], &(&1 * &1 * &1))
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  # def sum(list), do: _sum(list, 0)
  # defp _sum([], total), do: total
  # defp _sum([head | tail], total), do: head + _sum(tail, head + total)

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end
