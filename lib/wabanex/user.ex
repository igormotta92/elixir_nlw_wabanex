defmodule Wabanex.User do
  # Importa qualuer tipo de código
  use Ecto.Schema
  # Importa apenas uma função
  # definie como o dados são convertidos e validados
  import Ecto.Changeset

  alias Wabanex.Training

  # definindo que o campo id é um binary_id e ele será gerado automaticamente
  @primary_key {:id, :binary_id, autogenerate: true}

  # váriavel de modulo é uma constante que só existe nesse modulo
  @fields [:email, :name, :password]

  schema "users" do
    field(:email, :string)
    field(:name, :string)
    field(:password, :string)

    # Usuário tem um treino
    has_one :training, Training

    timestamps()
  end

  # É oque é enviado para o banco de dados
  # changeset é um tipo de struct que valida os vados que serão salvos no banco de dados
  # Insert e Updates são através do changeset
  def changeset(params) do
    # %Wabanex.User{}
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:name, min: 2)
    # regex
    |> validate_format(:email, ~r/@/)
    # necessário para gerar um erro e não uma exceção no banco de dados
    # Uma query é feita no banco e retornado um erro caso inválido
    |> unique_constraint([:email])
  end
end
