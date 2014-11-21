defmodule StringCalculator.DelimiterTest do
  use ExUnit.Case
  import StringCalculator.Delimiter

  test "when given a string with no custom delimiter, the default delimiter is returned" do
    assert delimiter_from("1,2,3") == ~r/(?:,|\n)/
  end

  test "when given a string with a custom delimiter, the custom delimiter is extracted and added to the defaults" do
    assert delimiter_from("//;\n1,2,3") == ~r/(?:;|,|\n)/
  end

  test "when given a string with a custom delimiter, the custom delimiter is escaped properly" do
    assert delimiter_from("//[***]\n1,2***3") == ~r/(?:\*\*\*|,|\n)/
  end
end
