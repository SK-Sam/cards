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

  test "contains? will check if a card is in the deck" do
    deck = Cards.create_deck
    card_1 = "Queen"
    card_2 = "ace"
    card_3 = "TWO"
    card_4 = "Ace"
    card_5 = "Two"
    card_6 = "Three"

    assert Cards.contains?(deck, card_1) == false
    assert Cards.contains?(deck, card_2) == false
    assert Cards.contains?(deck, card_3) == false

    assert Cards.contains?(deck, card_4) == true
    assert Cards.contains?(deck, card_5) == true
    assert Cards.contains?(deck, card_6) == true
  end
end
