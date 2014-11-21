defmodule StringCalculator.Delimiter do
  import StringCalculator.Regex
  import String, only: [split: 2]
  import Regex,  only: [run: 2]

  def delimiter_from(input) do
    delimiter_characters(input) |> delimiter_regex
  end

  defp default_delimiters, do: [",", "\n"]

  defp delimiter_characters(input) do
    case run delimiter_override_regex, input do
      [_, delimiter] -> [delimiter | default_delimiters]
      _              -> default_delimiters
    end
  end
end
