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
end
