defmodule Games.WordleTest do
  use ExUnit.Case
  doctest Games.Wordle
  alias Games.Wordle

  # Green if the letter is in the word and in the correct spot.
  # Yellow if the letter is in the word but in the incorrect spot.
  # Gray if the letter is not in the word.

  test "feedback/2 single gray" do
    # input: "a", "b"
    # output: [:grey]
    assert Wordle.feedback("a", "b") == [:grey]
  end

  test "feedback/2 single green" do
    # input: "a", "a"
    # output: [:green]
    assert Wordle.feedback("a", "a") == [:green]
  end

  test "feedback/2 single yellow" do
    # input: "ab", "bc"
    # output: [:yellow: :grey]
    assert Wordle.feedback("ab", "bc") == [:yellow, :grey]
  end

  test "feedback/2 all gray" do
    # input: "aaa", "bbb"
    # output: [:grey, :grey, :grey]
    assert Wordle.feedback("aaa", "bbb") == [:grey, :grey, :grey]
  end

  test "feedback/2 all green" do
    # input: "aaa", "aaa"
    # output: [:green, :green, :green]
    assert Wordle.feedback("aaa", "aaa") == [:green, :green, :green]
  end

  test "feedback/2 all yellow" do
    # input: "abc", "cab"
    # output: [:yellow, :yellow, :yellow]
    assert Wordle.feedback("abc", "cab") == [:yellow, :yellow, :yellow]
  end

  test "feedback/2 some gray some green" do
    # input: "abc", "ade"
    # output: [:green, :grey, :grey]
    assert Wordle.feedback("abc", "ade") == [:green, :grey, :grey]
  end

  test "feedback/2 some gray some yellow" do
    # input: "abc", "dcb"
    # output: [:grey, :yellow, :yellow]
    assert Wordle.feedback("abc", "dcb") == [:grey, :yellow, :yellow]
  end

  test "feedback/2 some green some yellow" do
    # input: "abc", "acb"
    # output: [:green, :yellow, :yellow]
    assert Wordle.feedback("abc", "acb") == [:green, :yellow, :yellow]
  end

  test "feedback/2 some gray some green some yellow" do
    # input: "abcd", "ebfc"
    # output: [:grey, :green, :grey, :yellow]
    assert Wordle.feedback("abcd", "ebfc") == [:grey, :green, :grey, :yellow]
  end

  # test "feedback/2 If there are duplicate characters in the guess prioritize exact matches" do
  #   assert Wordle.feedback("aaabb", "xaaaa") == [:grey, :green, :green, :yellow, :grey]
  end
end
