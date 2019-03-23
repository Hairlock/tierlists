defmodule TierlistsWeb.UserView do
  use TierlistsWeb, :view
  alias TierlistsWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      password_hash: user.password_hash,
      string: user.string,
      is_admin: user.is_admin,
      is_mod: user.is_mod}
  end
end
