defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0 do
    n * of(n-1)
  end

  def of_tail_recursion(n), do: _of(n, 1)
  defp _of(0, acc), do: acc
  defp _of(n, acc) when n > 0, do: _of(n-1, n*acc)

  def test(n) do
    {original_time, _output} = :timer.tc(Factorial, :of, [n])
    {fast_time, _output} = :timer.tc(Factorial, :of_tail_recursion, [n])

    IO.puts "tail_recursion: #{fast_time/1000.0}ms original_time: #{original_time/1000.0}ms"
  end
end
