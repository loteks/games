defmodule Games.GuessingGame do
  @moduledoc """
   Module implements Guessing Game
  """

  @doc """
  play function asks user for a number and compares it to a random number.
  If they are the same then user wins, if not ask for another guess or q to quit.
  """
  @spec play :: String.t()
  def play() do
    value = Enum.random(1..10)

    guess =
      IO.gets("Enter your guess or q to quit: ")
      |> String.trim()

    cond do
      guess == "q" ->
        "Bye!"

      value > String.to_integer(guess) ->
        IO.puts("To low!")
        play()

      value < String.to_integer(guess) ->
        IO.puts("To high!")
        play()

      value == String.to_integer(guess) ->
        "Correct!"

      value != String.to_integer(guess) ->
        IO.puts("Incorrect. The number was #{value}")
        play()
    end
  end
end
