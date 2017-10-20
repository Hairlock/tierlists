defmodule TierlistsWeb.PageController do
  use TierlistsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
