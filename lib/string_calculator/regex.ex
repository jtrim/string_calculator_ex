defmodule StringCalculator.Regex do
  import Enum, only: [join: 2, map: 2]

  def delimiter_override_regex, do: ~r/\/\/\[?([^\]\n]+)\]?\n/

  def delimiter_regex(delimiters) do
    ~r/(?:#{delimiters |> escape |> join("|")})/
  end

  defp escape(delimiters) do
    map delimiters, fn x ->
      case x do
        "\n" -> x
        _    -> Regex.escape(x)
      end
    end
  end
end
