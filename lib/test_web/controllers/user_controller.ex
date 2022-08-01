defmodule TestWeb.UserController do
  use TestWeb, :controller

  alias Test.Managment
  alias Test.Managment.User

  action_fallback TestWeb.FallbackController

  def login(conn, %{"username" => username, "password" => password}) do
    with %User{} = user <- Managment.get_user_by_username(username),
         true <- Pbkdf2.verify_pass(password, user.password) do
      token = "token"
      conn |> render("login.json", %{success: true, message: "Login successiful", token: token})
    else
      _ ->
        conn |> render("error.json", "Invalid credentials")
    end
  end

  def index(conn, _params) do
    users = Managment.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Managment.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Managment.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Managment.get_user!(id)

    with {:ok, %User{} = user} <- Managment.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Managment.get_user!(id)

    with {:ok, %User{}} <- Managment.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
