defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck can create a list of 3 string elements" do
    assert Cards.create_deck == ["Ace", "Two", "Three"]
  end

  test "shuffle_deck can change the order of the previous deck randomly" do
    deck = Cards.create_deck
    shuffled_deck = Cards.shuffle_deck(deck)

    assert shuffled_deck != deck
    assert Enum.count(shuffled_deck) == Enum.count(deck)
  end
end
