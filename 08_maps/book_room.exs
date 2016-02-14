defmodule HotelRoom do
  def book(%{name: name, height: height})
  when height > 1.9 do
    IO.puts "Need long bed for #{name}"
  end

  def book(%{name: name, height: height})
  when height < 1.3 do
    IO.puts "Need low shower controls for #{name}"
  end

  def book(person) do
    IO.puts "Any room works for #{person.name}"
  end
end

# people = [
#   %{ name: "Grumpy", height: 1.24 },
#   %{ name: "Dave", height: 1.88 },
#   %{ name: "Dopey", height: 1.32 },
#   %{ name: "Shaquille", height: 2.15 },
#   %{ name: "Sneezy", height: 1.28 },
# ]
#
# people |> Enum.each(&HotelRoom.book/1);
