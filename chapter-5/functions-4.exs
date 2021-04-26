prefix = fn prefix -> (fn s -> "#{prefix} #{s}" end) end
mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")