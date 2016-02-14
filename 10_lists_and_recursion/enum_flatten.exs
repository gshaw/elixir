# Exercise: ListsAndRecursion-6
#
defmodule EnumFlatten do
  # ​iex>​ EnumFlatten.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
  #
  def flatten([]), do: []
  def flatten([head | tail]) when not is_list(head) do
    # Naive poor performing but trivial implementation
    [head] ++ flatten(tail)
  end
  def flatten([head | tail]) do
    flatten(head) ++ flatten(tail)
  end

  # José Valim implementation using trees. Nice!
  # def flatten(list), do: _flatten(list, [])
  # defp _flatten([head | tail], right) when is_list(head) do
  #   _flatten(head, _flatten(tail, right))
  # end
  # defp _flatten([head | tail], right) do
  #   [head | _flatten(tail, right)]
  # end
  # defp _flatten([], right) do
  #   right
  # end
end
