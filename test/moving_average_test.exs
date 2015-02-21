defmodule MovingAverageTest do
  alias MovingAverage, as: M

  use ExUnit.Case, async: true

  test "Simple Moving Average is crossed from a low to high price movement" do
    assert _ == {:true, :up}
  end

  test "Simple Moving Average is crossed from a high to low price movement" do
    assert _ == {:true, :down}
  end

  test "Simple Moving Average is reached from low to high price movement" do
    assert _ == {:true, :up}
  end

  test "Simple Moving Average is crossed from high to low price movement" do
    assert _ == {:true, :down}
  end

  test "Simple Moving Average is not crossed, price moves low to high" do
    assert _ = {:false, :up}
  end

  test "Simple Moving Average is not crossed, price moves high to low" do
    assert _ = {:false, :down}
  end

  test "Exponential Moving Average is crossed from a low to high price movement" do
    assert _ == {:true, :up}
  end

  test "Exponential Moving Average is crossed from a high to low price movement" do
    assert _ == {:true, :down}
  end

  test "Exponential Moving Average is reached from low to high price movement" do
    assert _ == {:true, :down}
  end

  test "Exponential Moving Average is crossed from high to low price movement" do
    assert _ == {:true, :down}
  end

  test "Exponential Moving Average is not crossed, price moves low to high" do
    assert _ = {:false, :up}
  end

  test "Exponential Moving Average is not crossed, price moves high to low" do
    assert _ = {:false, :down}
  end
end
