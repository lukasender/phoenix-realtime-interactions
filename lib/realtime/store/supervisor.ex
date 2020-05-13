defmodule Realtime.Store.Supervisor do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    children = [
      {Realtime.Store, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
