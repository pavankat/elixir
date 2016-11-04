# iex length_converter_three.ex
# MeterToLengthConverter.Inch.convert(2.72)
  # result -> 107.08667200000001

# modules can be nested and flattened
defmodule MeterToLengthConverter.Feet do
  # function
  def convert(m) do
    m * 3.28084
  end
end

defmodule MeterToLengthConverter.Inch do
  def convert(m) do
    m * 39.3701
  end
end
