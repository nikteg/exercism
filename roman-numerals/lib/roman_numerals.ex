defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()

  def numeral(n) when n >= 1000, do: "M" <> numeral(div(n, 1000))
  def numeral(n) when n >= 500, do: "D" <> numeral(div(n, 500))
  def numeral(n) when n >= 100, do: "C" <> numeral(div(n, 100))
  def numeral(n) when n >= 50, do: "L" <> numeral(div(n, 50))
  def numeral(n) when n >= 10, do: "X" <> numeral(div(n, 10))
  def numeral(1), do: "I"
  def numeral(2), do: "II"
  def numeral(3), do: "III"
  def numeral(4), do: numeral(1) <> numeral(5)
  def numeral(5), do: "V"
  def numeral(10), do: "X"
  def numeral(50), do: "L"
  def numeral(100), do: "C"

  def numeral(n) do
    numeral(1) <> numeral(5)
  end
end
