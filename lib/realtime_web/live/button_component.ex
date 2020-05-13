defmodule Button do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <button phx-click="inc" phx-value-action="<%= @action %>" class="ping bg-transparent hover:bg-blue-100 text-blue-700 font-semibold py-2 px-4 border border-blue-100 rounded focus:outline-none focus:bg-white focus:shadow-outline focus:border-blue-300">
      <%= @text %> <span><%= @value %></span>
    </button>
    """
  end
end
