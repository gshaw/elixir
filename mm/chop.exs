# Binary search a range to find a specific value
#
defmodule Chop do
  def is_it?(n, _min, _max, guess) when n == guess do
    IO.puts n
  end

  def is_it?(_n, min, max, _guess) when max < min do
    :out_of_range
  end

  def is_it?(n, _min, max, guess) when n > guess do
    guess(n, (guess + 1)..max)
  end

  def is_it?(n, min, _max, guess) when n < guess do
    guess(n, min..(guess - 1))
  end

  def guess(n, range) do
    (min..max = range)
    guess = div((max - min), 2) + min
    IO.puts "Is it #{guess}"
    is_it?(n, min, max, guess)
  end
end
