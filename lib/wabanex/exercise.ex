defmodule Wabanex.Exercise do
  # Importa qualuer tipo de código
  use Ecto.Schema
  alias Wabanex.Training

  # Importa apenas uma função
  # definie como o dados são convertidos e validados
  import Ecto.Changeset

  # definindo que o campo id é um binary_id e ele será gerado automaticamente
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # váriavel de modulo é uma constante que só existe nesse modulo
  @fields [:name, :youtube_video_url, :protocol_description, :repetitions]

  schema "exercises" do
    field :name, :string
    field :youtube_video_url, :string
    field :protocol_description, :string
    field :repetitions, :string

    # Associação: Treino pertence a um usuário
    belongs_to :training, Training

    timestamps()
  end

  # Os exercícios serão enviados junto com o treino
  # Após todo o treino ser valido, todos os exercícios também serão validados
  # Com o "cast_assoc" o cast do modulo exercises é feito automaticamente
  def changeset(exercise, params) do
    # lib\wabanex\training.ex |> cast_assoc(:exercises)
    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
