defmodule IndicatorTest do
  use ExUnit.Case, async: true

  test "Simple Moving Average is crossed from a low to high price movement" do
    assert Indicator.crossed(100.0, 50.0, 150.0) == {:true, :up}
  end

  test "Simple Moving Average is crossed from a high to low price movement" do
    assert Indicator.crossed(100.0, 150.0, 50.0) == {:true, :down}
  end

  test "Simple Moving Average is reached from low to high price movement" do
    assert Indicator.crossed(100.0, 50.0, 100.0) == {:true, :up}
  end

  test "Simple Moving Average is reached from high to low price movement" do
    assert Indicator.crossed(100.0, 150.0, 100.0) == {:true, :down}
  end

  test "Simple Moving Average is not crossed, price moves low to high" do
    assert Indicator.crossed(100.0, 50.0, 99.99) == {:false, :up}
  end

  test "Simple Moving Average is not crossed, price moves high to low" do
    assert Indicator.crossed(100.0, 150.0, 100.01) == {:false, :down}
  end

  test "Simple Moving Average equal unchanged price" do
    assert Indicator.crossed(100.00, 100.0, 100.0) == {:true, :none}
  end

  test "Price does not change, does not equal Simple Moving Average" do
    assert Indicator.crossed(100.00, 10.0, 10.0) == {:false, :none}
  end

  test "Exponential Moving Average is crossed from a low to high price movement" do
    assert Indicator.crossed(100.0, 50.0, 150.0) == {:true, :up}
  end

  test "Exponential Moving Average is crossed from a high to low price movement" do
    assert Indicator.crossed(100.0, 150.0, 50.0) == {:true, :down}
  end

  test "Exponential Moving Average is reached from low to high price movement" do
    assert Indicator.crossed(100.0, 50.0, 100.0) == {:true, :up}
  end

  test "Exponential Moving Average is reached from high to low price movement" do
    assert Indicator.crossed(100.0, 150.0, 100.0) == {:true, :down}
  end

  test "Exponential Moving Average is not crossed, price moves low to high" do
    assert Indicator.crossed(100.0, 50.0, 99.99) == {:false, :up}
  end

  test "Exponential Moving Average is not crossed, price moves high to low" do
    assert Indicator.crossed(100.0, 150.0, 100.01) == {:false, :down}
  end

  test "Exponential Moving Average equal unchanged price" do
    assert Indicator.crossed(100.00, 100.0, 100.0) == {:true, :none}
  end

  test "Price does not change, does not equal Exponential Moving Average" do
    assert Indicator.crossed(100.00, 10.0, 10.0) == {:false, :none}
  end
end
