defmodule Strings do
  # Exercise: StringsAndBinaries-1
  #
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

  # Exercise: StringsAndBinaries-2
  #
  # Returns true if word1 and word2 are anagrams.
  def anagram?(word1, word2) do
    Enum.all?(word1, &(Enum.member?(word2, &1)))
  end

  # Alternate anagram solution
  # https://forums.pragprog.com/forums/322/topics/11940
  def anagram_alternate?(word1, word2) when length(word1) != length(word2), do: false
  def anagram_alternate?(word1, word2), do: (word1 -- word2) == []

  # Exercise: StringsAndBinaries-4
  #
  # Take a single-quoted string of the form number [+-*/] number and returns the
  # result of the calculation. The individual numbers do not have leading plus
  # or minus signs.
  #
  # | calculate(’123 + 27’) # => 150”
  #
  def calculate(expression) do
    { a, tail } = parse_number(expression)
    { op, tail } = parse_operator(tail)
    { b, _ } = parse_number(tail)

    case op do
      ?+ -> a + b
      ?- -> a - b
      ?* -> a * b
      ?/ -> a / b
    end
  end

  def parse_operator([op | tail])
  when op in '+-/*' do
    { op, tail }
  end

  def parse_number(str), do: _number_digits(str, 0)
  defp _number_digits([], value), do: { value, :eol }
  defp _number_digits([?\s | tail], value), do: _number_digits(tail, value)
  defp _number_digits([digit | tail], value)
  when digit in '0123456789' do
    _number_digits(tail, value * 10 + digit - ?0)
  end
  defp _number_digits(str, value) do
    { value, str }
  end
end
