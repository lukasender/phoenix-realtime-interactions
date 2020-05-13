defmodule RealtimeWeb.PageLive do
  use RealtimeWeb, :live_view

  alias Realtime.Store
  alias RealtimeWeb.Presence

  @impl true
  def mount(_params, _session, socket) do
    presence_topic = "page:home"
    if connected?(socket) do
      Store.subscribe()
      Store.inc_value(:views)
    end

    data = Store.get()
    presence = Presence.list(presence_topic) |> map_size

    # Presence
    Phoenix.PubSub.subscribe(Realtime.PubSub, presence_topic)
    Presence.track(self(), presence_topic, socket.id, %{user_id: "presence-#{presence}"})

    {:ok,
     assign(
      socket,
      views: data.views,
      likes: data.likes,
      hearts: data.hearts,
      smiles: data.smiles,
      kisses: data.kisses,
      parties: data.parties,
      beers: data.beers,
      presence: presence,
      script_example: "<script src=\"https://www.example.com/realtime.js?apikey=<your_api_key>\"></script>"
     )}
  end

  @impl true
  def handle_event(
    "inc",
    %{"action" => action}, socket
    ) when action in ["likes", "hearts", "smiles", "kisses", "parties", "beers"]
  do
    Store.inc_value(String.to_atom(action))
    {:noreply, socket}
  end

  @impl true
  def handle_info({:inc, key, value}, socket) do
    {:noreply, assign(socket, key, value)}
  end

  # handle presence
  @impl true
  def handle_info(
    %{event: "presence_diff", payload: %{joins: joins, leaves: leaves}},
    %{assigns: %{presence: count}} = socket
  ) do
    presence_count = count + map_size(joins) - map_size(leaves)
    {:noreply, assign(socket, presence: presence_count)}
  end
end
