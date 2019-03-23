defmodule Tierlists.AccountsTest do
  use Tierlists.DataCase

  alias Tierlists.Accounts

  describe "users" do
    alias Tierlists.Accounts.User

    @valid_attrs %{email: "some email", is_admin: true, is_mod: true, password_hash: "some password_hash", string: "some string"}
    @update_attrs %{email: "some updated email", is_admin: false, is_mod: false, password_hash: "some updated password_hash", string: "some updated string"}
    @invalid_attrs %{email: nil, is_admin: nil, is_mod: nil, password_hash: nil, string: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.is_admin == true
      assert user.is_mod == true
      assert user.password_hash == "some password_hash"
      assert user.string == "some string"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.is_admin == false
      assert user.is_mod == false
      assert user.password_hash == "some updated password_hash"
      assert user.string == "some updated string"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end