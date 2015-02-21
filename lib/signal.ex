defmodule Signal do
  import Indicator
  @doc """
  Checks if indicators have been hit
  """
  def check(:sma, data) do
    case Indicator.crossed(data[:moving_average], data[:previous_tick], data[:current_tick]) do
      {:false, direction} ->
        {:false}
      {:true, direction} ->
        {:sma, data[:ticker], direction, data[:current_tick], "timestamp"}
    end
  end

  def check(:ema, data) do
    case Indicator.crossed(data[:moving_average], data[:previous_tick], data[:current_tick]) do
      {:false, direction} ->
        {:false}
      {:true, direction} ->
        {:ema, data[:ticker], direction, data[:current_tick], "timestamp"}
    end
  end
end
