defmodule Games.Wordle do

  def play() do
    random_string = Enum.random(["toast", "tarts", "hello", "beats"])
    |> IO.inspect()
    play_more(random_string)
  end

  def play_more(random_string, count \\ 0) do
      IO.inspect(count, label: "count: ")
      guess_string = IO.gets("Enter a 5 letter word: ")
      |> String.trim()

      cond do
        count == 6 -> "Game over!"
        feedback(guess_string, random_string) == [:green, :green, :green, :green, :green] ->
          "You win!"
        true ->
            play_more(random_string, count + 1)
      end

    end

  def feedback(a, b) do

    list_a = String.split(a, "", trim: true)
    list_b = String.split(b, "", trim: true)

    Enum.zip_reduce(list_a, list_b, [], fn x, y, acc ->
      cond do
        x == y -> [:green | acc]
        y in list_a -> [:yellow | acc]
        y not in list_a -> [:gray | acc]
      end
    end)
    |> Enum.reverse()
  end
end
