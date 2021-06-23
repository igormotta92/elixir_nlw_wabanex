defmodule Wabanex.Users.Create do
  alias Wabanex.{Repo, User}

  def call(params) do
    params
    |> User.changeset() # preprarar dados
    |> Repo.insert() # persistir no banco 
  end
end
