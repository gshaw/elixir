defmodule DefaultParams do
  def func1(p1, p2 \\ 2, p3 \\3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end

  def func2(p1, p2 \\ 123)
  def func2(p1, p2) do
    IO.inspect [p1, p2]
  end

  def func3(p1, p2 \\ 123)
  def func3(p1, p2) when is_list(p1) do
    "You said #{p2} with list"
  end
  def func3(p1, p2) do
    "You passed #{p1} with #{p2}"
  end
end

# DefaultParams.func1("a", "b")
# DefaultParams.func1("a", "b", "c")
# DefaultParams.func1("a", "b", "c", "d")

# DefaultParams.func3(99)
# DefaultParams.func3(99, "cat")
# DefaultParams.func3([99])
# DefaultParams.func3([99], "dog")
