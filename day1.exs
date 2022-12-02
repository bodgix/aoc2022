example = """
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""

chunk_fun = fn elem, acc ->
  case elem do
    "" -> {:cont, Enum.sum(acc), []}

    _ ->
      {:cont, [String.to_integer(elem)|acc]}
  end
end

example
File.read!("day1.txt")
|> String.split("\n")
|> Enum.chunk_while([], chunk_fun, fn _ -> {:cont, []} end)
|> Enum.sort(&>=/2)
|> Enum.take(3)
|> Enum.sum()
|> IO.puts()
