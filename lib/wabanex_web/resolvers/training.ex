# Resolvers é só o meio de campo. Ele recebe os parâmetros e executa as ações
defmodule WabanexWeb.Resolvers.Training do
  # Função get recebe 2 argumentos, params e context
  def create(%{input: params}, _context), do: Wabanex.Trainings.Create.call(params)
end
