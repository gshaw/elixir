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

  # Exercise: ListsAndRecursion-1
  # Write a mapsum function that takes a list and a function. It applies the
  # function to each element of the list and then sums the result, so
  #
  # ​iex>​ MyList.mapsum [1, 2, 3], &(&1 * &1)
  # 14
  #
  def mapsum(list, func), do: _mapsum(list, func, 0)
  defp _mapsum([], _func, total), do: total
  defp _mapsum([head | tail], func, total) do
    _mapsum(tail, func, total + func.(head))
  end

  # Exercise: ListsAndRecursion-2
  # Write a max(list) that returns the element with the maximum value in the list
  #. (This is slightly trickier than it sounds.)
  #
  def max(list), do: _max(list, nil)
  defp _max([], max_value), do: max_value
  defp _max([head | tail], max_value) when (head > max_value) or (max_value == nil) do
    _max(tail, head)
  end
  defp _max([_head | tail], max_value), do: _max(tail, max_value)

  # Exercise: ListsAndRecursion-3
  # An Elixir single-quoted string is actually a list of individual character
  # codes. Write a caesar(list, n) function that adds n to each list element,
  # wrapping if the addition results in a character greater than z.
  #
  # ​iex>​ MyList.caesar(​'ryvkve'​, 13)
  # ​ ?????? :)”
  def caesar([], _shift), do: []
  def caesar([head | tail], shift) when head + rem(shift, 26) > 122 do
    [head + rem(shift, 26) - 26 | caesar(tail, shift)]
  end
  def caesar([head | tail], shift) do
    [head + rem(shift, 26) | caesar(tail, shift)]
  end
end
