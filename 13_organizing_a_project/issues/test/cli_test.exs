defmodule CLITest do
  use ExUnit.Case
  import Issues.CLI, only: [
    parse_args: 1,
    sort_into_ascending_order: 1
  ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "99" ]) == { "user", "project", 99 }
  end

  test "count is defauled if two values given" do
    assert parse_args(["user", "project" ]) == { "user", "project", 4 }
  end

  test "sort ascending issues correctly" do
    fake_list = [
      %{"created_at" => "c", "id" => 1},
      %{"created_at" => "a", "id" => 2},
      %{"created_at" => "b", "id" => 3}
    ]
    result = sort_into_ascending_order(fake_list)
    issues = for issue <- result, do: issue["created_at"]
    assert issues == ~w{a b c}
  end
end
