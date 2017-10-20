defmodule Tierlists.Session do
  use Tierlists.Utils, :model

  schema "sessions" do
    field :token, :string
    belongs_to :user, Tierlists.User

    timestamps()
  end

  @required_fields ~w(user_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the model and params

  If no params are provided return an invalid changeset
  """
  def changeset(model, params \\ :empty) do
    model
      |> cast(params, @required_fields, @optional_fields)
  end

  def registration_changeset(model, params \\ :empty) do
    model
      |> changeset(params)
      |> put_change(:token, SecureRandom.urlsafe_base64())
  end

end