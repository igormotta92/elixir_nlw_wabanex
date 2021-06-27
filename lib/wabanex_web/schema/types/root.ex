# Como se fosse o arquivo de rotas
defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver

  import_types WabanexWeb.Schema.Types.User

  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      # Chamando uma função de forma implícita de um modulo
      resolve &UserResolver.get/2
      # resolve fn params, context -> UserResolver.get(params, context) end
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
    end
  end
end
