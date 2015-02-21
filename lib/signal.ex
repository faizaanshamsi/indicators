defmodule Signal do
  import Indicator
  @doc """
  Checks if indicators have been hit
  """
  def check(name, data) when :ema == name or :sma == name do
    case Indicator.crossed(data[:moving_average], data[:previous_tick], data[:current_tick]) do
      {:false, direction} ->
        {:false}
      {:true, direction} ->
        {name, data[:ticker], direction, data[:current_tick], "timestamp"}
    end
  end

  #TODO: Fix this giant guard
  def check(name, data) when :bollinger_upper == name or :bollinger_lower == name or :bollinger_middle == name do
    case Indicator.crossed(data[:band], data[:previous_tick], data[:current_tick]) do
      {:false, direction} ->
        {:false}
      {:true, direction} ->
        {name, data[:ticker], direction, data[:current_tick], "timestamp"}
    end
  end
end
