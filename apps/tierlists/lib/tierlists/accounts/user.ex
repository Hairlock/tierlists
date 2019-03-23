defmodule Tierlists.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tierlists.Accounts.User


  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :is_mod, :boolean, default: false
    field :password_hash, :string
    field :string, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash, :string, :is_admin, :is_mod])
    |> validate_required([:email, :password_hash, :string, :is_admin, :is_mod])
  end
end
