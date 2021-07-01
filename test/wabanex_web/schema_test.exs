defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{email: "rafael@gmail.com", name: "Rafael", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      # String mult-line
      query = """
        {
          getUser(id: "#{user_id}") {
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        # :ok
        |> json_response(200)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "rafael@gmail.com",
            "name" => "Rafael"
          }
        }
      }

      assert expected_response == response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      user_id = "2528f731-cf0a-4d92-a940-f551df567a6f"

      # String mult-line
      query = """
        {
          getUser(id: "#{user_id}") {
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        # :ok
        |> json_response(:ok)

      #  assert "banana" == response

      assert %{
               "data" => %{"getUser" => nil},
               "errors" => [
                 %{
                   "locations" => _location,
                   "message" => "User not found",
                   "path" => _path
                 }
               ]
             } = response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      # String mult-line
      mutation = """
        mutation {
          createUser(input: {
            name: "Camila2",
            email: "camila2@banana.com",
            password: "123456"
          }) {
              id
              name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Camila2"}}} = response
    end
  end
end
