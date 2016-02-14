defmodule Ok do
  def ok!({ :ok, data }), do: data
  def ok!({ _, error }), do: raise "Error: #{error}"
end
