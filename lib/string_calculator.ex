defmodule StringCalculator do
  import StringCalculator.Delimiter
  import StringCalculator.Regex
  import String, only: [to_integer: 1]
  import Regex,  only: [split: 2]
  import Enum,   only: [map: 2, sum: 1, filter: 2, join: 2]

  def add("") do
    0
  end

  def add(input) do
    delimiter_from(input)
    |> split(numbers_from(input))
    |> map(&to_integer/1)
    |> validate
    |> filter_to_maximum(1000)
    |> sum
  end

  defp validate(numbers) do
    case filter numbers, &negative?/1 do
      []        -> numbers
      negatives -> raise_negatives(negatives)
    end
  end

  defp raise_negatives(negatives) do
    raise "negatives not allowed: #{negatives
                                    |> map(&to_string/1)
                                    |> join(", ")}"
  end

  defp filter_to_maximum(numbers, maximum) do
    filter numbers, (fn i -> i <= maximum end)
  end

  defp negative?(i) do
    i < 0
  end

  defp numbers_from(input) do
    case split delimiter_override_regex, input do
      [_, n] -> n
      [n] -> n
    end
  end
end
