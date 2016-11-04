# iex length_converter_two.ex
# MeterToLengthConverter.Inch.convert(2.72)
  # result -> 107.08667200000001

# modules can be nested
defmodule MeterToLengthConverter do
  # module nested in another module
  defmodule Feet do
    # function
    # meters to feet
    def convert(m) do
      m * 3.28084
    end
  end

  defmodule Inch do
    # meters to inches
    def convert(m) do
      m * 39.3701
    end
  end
end
