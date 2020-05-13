defmodule Realtime.Store do
  use GenServer
  alias Realtime.PubSub

  # Client API

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{
      views: 0,
      likes: 0,
      hearts: 0,
      smiles: 0,
      kisses: 0,
      parties: 0,
      beers: 0,
    }, name: __MODULE__)
  end

  def get, do: GenServer.call(__MODULE__, :get)
  def inc_value(key), do: GenServer.cast(__MODULE__, %{inc: key})

  # Server (callbacks)

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:get, _from, state) do
    {:reply, %{
      views: state.views,
      likes: state.likes,
      hearts: state.hearts,
      smiles: state.smiles,
      kisses: state.kisses,
      parties: state.parties,
      beers: state.beers,
    }, state}
  end

  @impl true
  def handle_cast(%{inc: key}, state) do
    new_value = Map.get(state, key) + 1
    broadcast(:inc, key, new_value)
    {:noreply, Map.put(state, key, new_value)}
  end

  def subscribe do
    Phoenix.PubSub.subscribe(PubSub, "data")
  end

  defp broadcast(action, key, value) do
    Phoenix.PubSub.broadcast(PubSub, "data", {action, key, value})
  end
end
