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
  #Bollinger Bands
  # test "Exponential Moving Average" do
  #   data = %{
  #     lower_band: 50.0,
  #     middle_band: 100.0,
  #     upper_band: 150.0,
  #     previous_tick: 10.0,
  #     current_tick: 250.0
  #   }
  #   assert Signal.check(:bollinger, data) ==
  # end

  #VWAP

  #Chandelier Exit


end
