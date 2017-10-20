defmodule TierlistsWeb.UserController do
  use TierlistsWeb, :controller

  alias Tierlists.User
  alias Tierlists.Repo

  plug :scrub_params, "user" when action in [:create]

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
          |> put_status(:created)
          |> render("show.json", user: user)
      {:error, changeset} ->
        conn
          |> put_status(:unprocessable_entity)
          |> render(TierlistsWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  


end
