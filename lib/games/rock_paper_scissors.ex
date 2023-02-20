defmodule Games.RockPaperScissors do
  @moduledoc """
    Module implements Rock Paper Scissors game
  """

  @doc """
  play function asks user to input rock, paper or scissors
  then compares to random rock paper or scissors to determine winner
  """
  @spec play :: String.t()
  def play() do
    player2 = Enum.random([:rock, :paper, :scissors])
    IO.puts(player2)

    # worker bee
    player1 =
      IO.gets("Enter your guess: ")
      |> String.trim()
      |> String.to_existing_atom()

    # functional core
    case {player1, player2} do
      {:rock, :scissors} -> "You win! Rock beats scissors."
      {:paper, :rock} -> "You win! Paper beats rock."
      {:scissors, :paper} -> "You win! Scissors beats paper."
      {:rock, :paper} -> "You lose! Paper beats rock."
      {:paper, :scissors} -> "You lose! Scissors beats paper."
      {:scissors, :rock} -> "You lose! Rock beats scissors."
      {same, same} -> "It's a tie!"
    end
  end
end
