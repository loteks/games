defmodule Games.GuessingGame do
  def play() do
    value = Enum.random(1..10)

    guess =
      IO.gets("Enter your guess or q to quit: ")
      |> String.trim()

    IO.inspect(binding())

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
