defmodule AoC2021.Day1 do
  def read_input(file) do
  {:ok, content} = File.read(file)
  content |> String.split("\n", trim: true) |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
  end
  
  def solution_1(input) do
    [h | t] = input
  {_last, count} = t
  |> Enum.reduce({h,0}, fn (curr, {prev, count}) ->
		      if curr > prev do
			{curr, count + 1}
		      else
			{curr, count}
		      end
  end)
  count
  end

  def solution_2(input) do
    input
    |> Enum.chunk_every(3, 1)
    |> Enum.map(fn x -> Enum.reduce(x, &+/2) end)
    |> solution_1 
  end

  def main_1 do
    read_input("lib/day_1/input")
    |> solution_1
  end

  def main_2 do
    read_input("lib/day_1/input")
    |> solution_2
  end
end
