defmodule WabanexWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  # Password não é retornado na API (geralemente)
  @desc "Logic exercise represetation"
  object :exercise do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :youtube_video_url, non_null(:string)
    field :protocol_description, non_null(:string)
    field :repetitions, non_null(:string)
  end

  input_object :create_exercise_input do
    field :name, non_null(:string), description: "User name"
    field :youtube_video_url, non_null(:string), description: "User youtube video url"
    field :protocol_description, non_null(:string), description: "User protocol description"
    field :repetitions, non_null(:string), description: "User repetitions"
  end
end
