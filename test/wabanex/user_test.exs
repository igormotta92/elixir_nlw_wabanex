defmodule Wabanex.UserTest do
  # O Postgres funciona com [async: true]
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Rafael", email: "rafael@gmail.com", password: "123456"}

      response = User.changeset(params)

      # expected_response

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "rafael@gmail.com", name: "Rafael", password: "123456"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{name: "R", email: "rafael@gmail.com"}

      response = User.changeset(params)

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
