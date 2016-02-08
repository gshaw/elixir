# Exercise: Implement all?, each, filter, split, and take without any libraries.
#
defmodule EnumTest do

  # def all?(enumerable, fun \\ fn x -> x end)
  #
  # Invokes the given fun for each item in the enumerable. It stops the iteration
  # at the first invocation that returns false or nil. It returns false if at least
  # one invocation returns false or nil. Otherwise returns true.
  #
  # Examples
  #
  # ┃ iex> EnumTest.all?([2, 4, 6], fn(x) -> rem(x, 2) == 0 end)
  # ┃ true
  # ┃
  # ┃ iex> EnumTest.all?([2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
  # ┃ false
  #
  # If no function is given, it defaults to checking if all items in the enumerable
  # are truthy values.
  #
  # ┃ iex> EnumTest.all?([1, 2, 3])
  # ┃ true
  # ┃
  # ┃ iex> EnumTest.all?([1, nil, 3])
  # ┃ false
  #
  def all?(enumerable), do: all?(enumerable, fn x -> x end)
  def all?([], _fun), do: true
  def all?([head | tail], fun) do
    if fun.(head) do
      all?(tail, fun)
    else
      false
    end
  end

  # Invokes the given fun for each item in the enumerable.
  #
  # Returns :ok.
  #
  # Examples
  #
  # ┃ EnumTest.each(["some", "example"], fn(x) -> IO.puts x end)
  # ┃ "some"
  # ┃ "example"
  # ┃ #=> :ok
  #
  def each([], _fun), do: :ok
  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  # Filters the enumerable, i.e. returns only those elements for which fun returns
  # a truthy value.
  #
  # Examples
  #
  # ┃ iex> EnumTest.filter([1, 2, 3], fn(x) -> rem(x, 2) == 0 end)
  # ┃ [2]
  #
  def filter([], _fun), do: []
  def filter([head | tail], fun) do
    if fun.(head) do
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end
end
