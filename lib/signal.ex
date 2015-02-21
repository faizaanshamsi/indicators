defmodule Signal do
  import Indicator
  @doc """
  Checks if indicators have been hit
  """
  def check(name, data) when name == :ema or name == :sma do
    case Indicator.crossed(data[:moving_average], data[:previous_tick], data[:current_tick]) do
      {:false, direction} ->
        {:false}
      {:true, direction} ->
        {name, data[:ticker], direction, data[:current_tick], "timestamp"}
    end
  end
end
