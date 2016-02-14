defmodule Prime do
  # Return a list of primary numbers from 2 to n.
  def primes_up_to(n) when n < 2, do: :error
  def primes_up_to(n) do
    for x <- span(2, n), prime?(x), do: x
  end

  # Returns true if the given number is prime, otherwise false.
  def prime?(n) when n <= 0, do: :error
  def prime?(n) when n == 1, do: false
  def prime?(n) when n == 2, do: true
  def prime?(n) do
    # Use Trial division to calculate primes
    # https://en.wikipedia.org/wiki/Trial_division
    span(2, round(:math.sqrt(n)))
    |> Enum.all?(&rem(n, &1) != 0)
  end

  # Return a list of values between from and to.
  def span(from, to) when from >= to, do: [from]
  def span(from, to), do: [from | span(from + 1, to)]
end
