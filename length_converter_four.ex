# iex length_converter_four.ex
# MeterToLengthConverter.convert(:feet, 2.72)
  # result -> 8.9238848

defmodule MeterToLengthConverter do
  # function
  # we're using function clauses
  def convert(:feet, m) do
    m * 3.28084
  end

  def convert(:inch, m) do
    m * 39.3701
  end
end
