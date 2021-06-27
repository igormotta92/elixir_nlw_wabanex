defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  # Importando dos os tipos para desse arquivo para este modulo
  # import_types WabanexWeb.Schema.Types.Custom.UUID4

  # Password não é retornado na API (geralemente)
  @desc "Logic user represetation"
  object :user do
    # uuid4 é um tipo custom que será criado no Absinthe
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "User name"
    field :email, non_null(:string), description: "User email"
    field :password, non_null(:string), description: "User password"
  end
end
