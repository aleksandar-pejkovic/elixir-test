defmodule Test.ManagmentTest do
  use Test.DataCase

  alias Test.Managment

  describe "users" do
    alias Test.Managment.User

    import Test.ManagmentFixtures

    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, password: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Managment.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Managment.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", first_name: "some first_name", last_name: "some last_name", password: "some password", username: "some username"}

      assert {:ok, %User{} = user} = Managment.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Managment.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", password: "some updated password", username: "some updated username"}

      assert {:ok, %User{} = user} = Managment.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Managment.update_user(user, @invalid_attrs)
      assert user == Managment.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Managment.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Managment.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Managment.change_user(user)
    end
  end

  describe "documents" do
    alias Test.Managment.Document

    import Test.ManagmentFixtures

    @invalid_attrs %{}

    test "list_documents/0 returns all documents" do
      document = document_fixture()
      assert Managment.list_documents() == [document]
    end

    test "get_document!/1 returns the document with given id" do
      document = document_fixture()
      assert Managment.get_document!(document.id) == document
    end

    test "create_document/1 with valid data creates a document" do
      valid_attrs = %{}

      assert {:ok, %Document{} = document} = Managment.create_document(valid_attrs)
    end

    test "create_document/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Managment.create_document(@invalid_attrs)
    end

    test "update_document/2 with valid data updates the document" do
      document = document_fixture()
      update_attrs = %{}

      assert {:ok, %Document{} = document} = Managment.update_document(document, update_attrs)
    end

    test "update_document/2 with invalid data returns error changeset" do
      document = document_fixture()
      assert {:error, %Ecto.Changeset{}} = Managment.update_document(document, @invalid_attrs)
      assert document == Managment.get_document!(document.id)
    end

    test "delete_document/1 deletes the document" do
      document = document_fixture()
      assert {:ok, %Document{}} = Managment.delete_document(document)
      assert_raise Ecto.NoResultsError, fn -> Managment.get_document!(document.id) end
    end

    test "change_document/1 returns a document changeset" do
      document = document_fixture()
      assert %Ecto.Changeset{} = Managment.change_document(document)
    end
  end
end
