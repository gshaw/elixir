defmodule Strings do
  # Exercise: StringsAndBinaries-1
  # Write a function that returns true if a single-quoted string contains only
  # printable ASCII characters (space through tilde).
  #
  def is_printable_ascii([]), do: true
  def is_printable_ascii([head | tail]) do
    if (head < ?\s || head > ?~) do
      false
    else
      is_printable_ascii(tail)
    end
  end

  # Alternate solution using Enum methods
  def is_printable_ascii_alternate(string) do
    printable_ascii = ?\s..?~
    Enum.all?(string, &(Enum.member?(printable_ascii, &1)))
  end
end
