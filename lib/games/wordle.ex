defmodule Games.Wordle do
  @moduledoc """
    Module implements Wordle game
  """
  @spec play :: String.t()
  @doc """
  play function generates a random string and prompts user for input
  """
  def play() do
    random_string = Enum.random(["toast", "tarts", "hello", "beats"])
    play_more(random_string)
  end

  @spec play_more(String.t(), integer()) :: String.t()
  @doc """
  play_more function wraps play function to add a count variable and enable looping
  """

  def play_more(random_string, count \\ 0) do
    guess_string =
      IO.gets("Enter a 5 letter word: ")
      |> String.trim()

    cond do
      count == 6 ->
        "Game over!"

      feedback(guess_string, random_string) == [:green, :green, :green, :green, :green] ->
        "You win!"

      true ->
        play_more(random_string, count + 1)
    end
  end

  @spec feedback(String.t(), String.t()) :: [atom()]
  @doc """

  Function compares 2 strings and returns a list of atoms

  ## Examples

      iex> Games.Wordle.feedback("aaaaa", "aaaaa")
      [:green, :green, :green, :green, :green]

      iex> Games.Wordle.feedback("aaaaa", "aaaab")
      [:green, :green, :green, :green, :grey]

      iex> Games.Wordle.feedback("abdce", "edcba")
      [:yellow, :yellow, :yellow, :yellow, :yellow]

      # # If there are duplicate characters in the guess prioritize exact matches.
      # iex> Games.Wordle.feedback("aaabb", "xaaaa")
      # [:grey, :green, :green, :yellow, :grey]

  """

  def feedback(a, b) do
    list_a = String.split(a, "", trim: true)
    list_b = String.split(b, "", trim: true)

    Enum.zip_reduce(list_a, list_b, [], fn x, y, acc ->
      cond do
        x == y -> [:green | acc]
        y in list_a -> [:yellow | acc]
        y not in list_a -> [:grey | acc]
      end
    end)
    |> Enum.reverse()
  end
end
