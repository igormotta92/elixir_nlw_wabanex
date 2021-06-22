# Programação funcional é compor funções pura que fazem uma coisa só sem efeitos colaterais
# Funções que usam pattern match devem estar juntas como boa prática
# Um modulo é um agrupador de funções

defmodule Wabanex.IMC do
  # result = File.read(filename)
  # handle_file(result)
  def calculate(%{"filename" => filename}) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}) do
    data =
      content
      |> String.split("\r\n")
      |> Enum.map(fn line -> parse_line(line) end)
      |> Enum.into(%{})

    {:ok, data}
  end

  defp handle_file({:error, _reason}) do
    # reason
    {:error, "Error while opening the file"}
  end

  # match com qualquer entrada
  defp handle_file(_) do
    "Erro pattern math"
  end

  defp parse_line(line) do
    # IO.inspect() echo do PHP
    line
    |> String.split(",")
    # fn element -> String.to_float(element) end
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()

    # |> IO.inspect()
  end

  defp calculate_imc([name, height, weight]), do: {name, weight / (height * height)}
end
