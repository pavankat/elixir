# iex length_converter.ex
# then
# MeterToFootConverter.convert(2.72)
# result -> 8.9238848

# if you want to learn more about Map then do h Map in iex
# h Dict.put/3 will show documentation for that
# the 3 means three arguments
defmodule MeterToFootConverter do
  def convert(m) do
    m * 3.28084
  end
end
