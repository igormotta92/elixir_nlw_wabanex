defmodule Wabanex.Users.Create do
  alias Wabanex.{Repo, User}

  def call(params) do
    params
    # preprarar dados
    |> User.changeset()
    # persistir no banco
    |> Repo.insert()
  end
end
