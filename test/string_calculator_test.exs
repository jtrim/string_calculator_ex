defmodule StringCalculatorTest do
  use ExUnit.Case
  import StringCalculator, only: [add: 1]

  test "when given an empty string, zero is returned" do
    assert add("") == 0
  end

  test "when given a single number, that number is returned" do
    assert add("1") == 1
  end

  test "when given two comma-delimited numbers, their sum is returned" do
    assert add("1,2") == 3
  end

  test "when given several comma-delimited numbers, their sum is returned" do
    assert add("1,2,3,4,5") == 15
  end

  test "when given numbers delimited with newlines and commas, their sum is returned" do
    assert add("1,2,3,4\n5") == 15
  end

  test "when given numbers with a custom delimiter set, their sum is returned" do
    assert add("//;\n1,2,3\n4;5") == 15
  end

  test "when given any negative numbers, an exception is raised" do
    assert_raise RuntimeError, "negatives not allowed: -1, -3", fn ->
      add("-1,2,-3")
    end
  end

  test "only numbers <= 1000 are summed" do
    assert add("1,2,1000,1001,3") == 1006
  end

  test "a multi-char custom delimiter in the format of //[***]\\n is acceptable" do
    assert add("//[***]\n1***2,3\n4") == 10
  end
end
