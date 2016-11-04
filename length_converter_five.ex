# iex length_converter_four.ex
# MeterToLengthConverter.convert(:feet, 2.72)
  # result -> 8.9238848

# Single-lined functions are written like so:
#
# def convert(:feet, m), do: m * 3.28084

defmodule MeterToLengthConverter do
  # we're using function clauses and one lined functions
  # you refer to convert by its arity (the # of arguments) as in convert/2
  def convert(:feet, m), do: m * 3.28084
  def convert(:inch, m), do: m * 39.3701
  def convert(:yard, m), do: m * 1.09361
end
