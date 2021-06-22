# COntrollers são usad em API Restfull em sua maioria

defmodule WabanexWeb.IMCController do
  # incluindo funcionalidades no modulo
  use WabanexWeb, :controller

  # Quando não se defini uma alias o ultimo nome do Modulo é o que passa a ser a alias
  alias Wabanex.IMC

  # conexão e parâmetros
  def index(conn, params) do
    params
    # |> Wabanex.IMC.calculate()
    |> IMC.calculate()
    |> handle_response(conn)

    # Debug
    # IO.inspect(params)
    # IO.inspect(conn)
    # conn |> text("teste")
  end

  '''
  def handle_response({:ok, result}, conn) do
    conn
    |> put_status(:ok)
    |> json(result)
  end

  def handle_response({:error, result}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(result)
  end
  '''

  def handle_response({:ok, result}, conn), do: render_response(conn, result, :ok)
  def handle_response({:error, result}, conn), do: render_response(conn, result, :bad_request)

  '''
  Atom -> name: (nome mais dois pontos)

  # String
  map = %{"a" => 1}
  map["a"] = 1

  # Atom
  map2 = %{a: => 1}
  map2.a = 1

  '''

  defp render_response(conn, result, status) do
    conn
    |> put_status(status)
    |> json(%{result: result})
  end
end
