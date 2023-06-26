defmodule CaptureLogConfigReproduction do
  @moduledoc """
  Documentation for `CaptureLogConfigReproduction`.
  """

  require Logger

  @doc """
  Hello world.

  ## Examples

      iex> CaptureLogConfigReproduction.hello()
      :world

  """
  def hello do
    Logger.info("This is a log")
    :world
  end
end
