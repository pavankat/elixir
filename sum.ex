# 1.  Implement sum/1. This function should take in a list of numbers and return the sum of the list.

# iex exercise1.ex
# Math.exec([1,3,5])
  # result -> 9
# Math.sum_list([2,3,4], 0)
  # result -> 9

# how this works -> with recursion
  # sum_list [1, 2, 3], 0
  # sum_list [2, 3], 1
  # sum_list [3], 3
  # sum_list [], 6

defmodule Math do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end

defmodule MathShort do
  def sum_list(list) do
    Enum.reduce(list, 0, fn(x, acc) -> x + acc end)
  end
end
