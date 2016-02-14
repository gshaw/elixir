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
  # https://forums.pragprog.com/forums/322/topics/11939
  def is_printable_ascii_alternate(string) do
    printable_ascii = ?\s..?~
    Enum.all?(string, &(Enum.member?(printable_ascii, &1)))
  end

  # Returns true if word1 and word2 are anagrams.
  def anagram?(word1, word2) do
    Enum.all?(word1, &(Enum.member?(word2, &1)))
  end

  # Alternate anagram solution
  # https://forums.pragprog.com/forums/322/topics/11940
  def anagram_alternate?(word1, word2) when length(word1) != length(word2), do: false
  def anagram_alternate?(word1, word2), do: (word1 -- word2) == []
end
