defmodule SignalTest do
  use ExUnit.Case, async: true

  #SMA
  test "Simple Moving Average is crossed" do
    data = %{
      ticker: "GOOG",
      moving_average: 100.0,
      previous_tick: 50.0,
      current_tick: 150.0
    }
    assert Signal.check(:sma, data) == {:sma, "GOOG", :up, 150.0 ,"timestamp"}
  end

  test "Simple Moving Average is not" do
    data = %{
      ticker: "GOOG",
      moving_average: 100.0,
      previous_tick: 50.0,
      current_tick: 99.99
    }
    assert Signal.check(:sma, data) == {:false}
  end
  #EMA
  test "Exponential Moving Average is crossed" do
    data = %{
      ticker: "GOOG",
      moving_average: 100.0,
      previous_tick: 50.0,
      current_tick: 150.0
    }
    assert Signal.check(:ema, data) == {:ema, "GOOG", :up, 150.0, "timestamp"}
  end

  test "Exponential Moving Average is not crossed" do
    data = %{
      ticker: "GOOG",
      moving_average: 100.0,
      previous_tick: 50.0,
      current_tick: 99.99
    }
    assert Signal.check(:ema, data) == {:false}
  end
  # Bollinger Bands
  test "Lower Bollinger Band" do
    data = %{
      ticker: "GOOG",
      band: 50.0,
      previous_tick: 10.0,
      current_tick: 250.0
    }
    result = {:bollinger_lower, "GOOG", :up, 250.0, "timestamp"}
    assert Signal.check(:bollinger_lower, data) == result
  end

  test "Middle Bollinger Band" do
    data = %{
      ticker: "GOOG",
      band: 50.0,
      previous_tick: 10.0,
      current_tick: 250.0
    }
    result = {:bollinger_middle, "GOOG", :up, 250.0, "timestamp"}
    assert Signal.check(:bollinger_middle, data) == result
  end

  test "Upper Bollinger Band" do
    data = %{
      ticker: "GOOG",
      band: 50.0,
      previous_tick: 10.0,
      current_tick: 250.0
    }
    result = {:bollinger_upper, "GOOG", :up, 250.0, "timestamp"}
    assert Signal.check(:bollinger_upper, data) == result
  end

  #VWAP

  #Chandelier Exit


end
