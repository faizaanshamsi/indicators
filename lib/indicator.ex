defmodule Indicator do
  @doc """
  Checks if indicators have been hit
  """

  def crossed(moving_average, previous_tick, current_tick) do
    cond do
      previous_tick == current_tick && current_tick == moving_average ->
        {:true, :none}
      previous_tick == current_tick && current_tick != moving_average ->
        {:false, :none}
      previous_tick <= moving_average && current_tick >= moving_average ->
        {:true, :up}
      current_tick <= moving_average && previous_tick >= moving_average ->
        {:true, :down}
      current_tick < moving_average && previous_tick < current_tick ->
        {:false, :up}
      true ->
        {:false, :down}
    end
  end
end
