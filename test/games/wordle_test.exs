defmodule Games.WordleTest do
  use ExUnit.Case
  doctest Games.Wordle
  alias Games.Wordle

  # Green if the letter is in the word and in the correct spot.
  # Yellow if the letter is in the word but in the incorrect spot.
  # Gray if the letter is not in the word.

  test "feedback/2 single gray" do
    # input: "a", "b"
    # output: [:gray]
    assert Wordle.feedback("a", "b") == [:gray]
  end

  test "feedback/2 single green" do
    # input: "a", "a"
    # output: [:green]
    assert Wordle.feedback("a", "a") == [:green]
  end

  test "feedback/2 single yellow" do
    # input: "ab", "bc"
    # output: [:yellow: :gray]
    assert Wordle.feedback("ab", "bc") == [:yellow, :gray]
  end

  test "feedback/2 all gray" do
    # input: "aaa", "bbb"
    # output: [:gray, :gray, :gray]
    assert Wordle.feedback("aaa", "bbb") == [:gray, :gray, :gray]
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
    # output: [:green, :gray, :gray]
    assert Wordle.feedback("abc", "ade") == [:green, :gray, :gray]
  end

  test "feedback/2 some gray some yellow" do
    # input: "abc", "dcb"
    # output: [:gray, :yellow, :yellow]
    assert Wordle.feedback("abc", "dcb") == [:gray, :yellow, :yellow]
  end

  test "feedback/2 some green some yellow" do
    # input: "abc", "acb"
    # output: [:green, :yellow, :yellow]
    assert Wordle.feedback("abc", "acb") == [:green, :yellow, :yellow]
  end

  test "feedback/2 some gray some green some yellow" do
    # input: "abcd", "ebfc"
    # output: [:gray, :green, :gray, :yellow]
    assert Wordle.feedback("abcd", "ebfc") == [:gray, :green, :gray, :yellow]
  end
end
