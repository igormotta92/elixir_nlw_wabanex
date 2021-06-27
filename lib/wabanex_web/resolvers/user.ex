# Resolvers é só o meio de campo. Ele recebe os parâmetros e executa as ações
defmodule WabanexWeb.Resolvers.User do
  # Função get recebe 2 argumentos, params e context
  def get(%{id: user_id}, _context), do: Wabanex.Users.Get.call(user_id)
  def create(%{input: params}, _context), do: Wabanex.Users.Create.call(params)
end
