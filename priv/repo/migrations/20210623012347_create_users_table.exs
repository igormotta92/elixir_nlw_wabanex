defmodule Wabanex.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  # change já está preparado para ter rollback, é possivel usar função up e down
  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :password, :string

      timestamps() #insertd_at e updated_at
    end

    create unique_index(:users, [:email])
  end
end
