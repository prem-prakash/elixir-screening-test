defmodule ElixirInterviewStarter.CalibrationSupervisor do
  @moduledoc """
  Starts Calibration Supervisor
  """
  use DynamicSupervisor

  def start_link(_args) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def terminate_all_children do
    __MODULE__
    |> DynamicSupervisor.which_children()
    |> Enum.each(fn child ->
      DynamicSupervisor.terminate_child(__MODULE__, elem(child, 1))
    end)
  end
end
