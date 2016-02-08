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

  # Splits the enumerable into two enumerables, leaving count elements in the first
  # one. If count is a negative number, it starts counting from the back to the
  # beginning of the enumerable.
  #
  # Be aware that a negative count implies the enumerable will be enumerated twice:
  # once to calculate the position, and a second time to do the actual splitting.
  #
  # Examples
  #
  # ┃ iex> EnumTest.split([1, 2, 3], 2)
  # ┃ {[1, 2], [3]}
  # ┃
  # ┃ iex> EnumTest.split([1, 2, 3], 10)
  # ┃ {[1, 2, 3], []}
  # ┃
  # ┃ iex> EnumTest.split([1, 2, 3], 0)
  # ┃ {[], [1, 2, 3]}
  # ┃
  # ┃ iex> EnumTest.split([1, 2, 3], -1)
  # ┃ {[1, 2], [3]}
  # ┃
  # ┃ iex> EnumTest.split([1, 2, 3], -5)
  # ┃ {[], [1, 2, 3]}
  #
  def split([], _count), do: {[], []}
  def split(enumerable, 0), do: {[], enumerable}
  def split([head | tail], count) when count > 0 do
    # WARNING: Does not use tail call optimization so this will stack overflow
    # for large enumerations.  Good thing we can just use Enum.split.
    { left, right } = split(tail, count - 1)
    { [head] ++ left, right }
  end
  def split(enumerable, count) when count < 0 do
    length = count(enumerable) # implementation below
    count = length + count
    if count < 0 do
      count = 0
    end
    split(enumerable, count)
  end

  # Returns the size of the enumerable.
  #
  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)
end
