defmodule Wabanex.Training do
  # Importa qualuer tipo de código
  use Ecto.Schema
  alias Wabanex.{Exercise, User}

  # Importa apenas uma função
  # definie como o dados são convertidos e validados
  import Ecto.Changeset

  # definindo que o campo id é um binary_id e ele será gerado automaticamente
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # váriavel de modulo é uma constante que só existe nesse modulo
  @fields [:end_date, :start_date, :user_id]

  schema "trainings" do
    field(:start_date, :date)
    field(:end_date, :date)

    # Associação: Treino pertence a um usuário
    belongs_to :user, User
    has_many :exercises, Exercise

    timestamps()
  end

  # Os exercícios serão enviados junto com o treino
  # Após todo o treino ser valido, todos os exercícios também serão validados
  # Com o "cast_assoc" o cast do modulo exercises é feito automaticamente
  def changeset(params) do
    # %Wabanex.Training{}
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint([:email])
    |> cast_assoc(:exercises)
  end
end
