defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck can create a list of 3 string elements" do
    deck = Cards.create_deck
    aces_count = Enum.count(deck, fn(card) -> String.contains?(card, "Ace") end)
    twos_count = Enum.count(deck, fn(card) -> String.contains?(card, "Two") end)
    threes_count = Enum.count(deck, fn(card) -> String.contains?(card, "Three") end)
    spades_count = Enum.count(deck, fn(card) -> String.contains?(card, "Spades") end)
    diamonds_count = Enum.count(deck, fn(card) -> String.contains?(card, "Diamonds") end)
    hearts_count = Enum.count(deck, fn(card) -> String.contains?(card, "Hearts") end)
    clubs_count = Enum.count(deck, fn(card) -> String.contains?(card, "Clubs") end)

    assert aces_count == 4
    assert twos_count == 4
    assert threes_count == 4
    assert spades_count == 3
    assert diamonds_count == 3
    assert hearts_count == 3
    assert clubs_count == 3
  end

  test "shuffle_deck can change the order of the previous deck randomly" do
    deck = Cards.create_deck
    shuffled_deck = Cards.shuffle_deck(deck)

    assert shuffled_deck != deck
    assert Enum.count(shuffled_deck) == Enum.count(deck)
  end

  test "contains? will check if a card is in the deck" do
    deck = Cards.create_deck
    card_1 = "Queen of Spades"
    card_2 = "ace of Spades"
    card_3 = "TWO of Hearts"
    card_4 = "Ace of Hearts"
    card_5 = "Two of Diamonds"
    card_6 = "Three of Clubs"

    assert Cards.contains?(deck, card_1) == false
    assert Cards.contains?(deck, card_2) == false
    assert Cards.contains?(deck, card_3) == false

    assert Cards.contains?(deck, card_4) == true
    assert Cards.contains?(deck, card_5) == true
    assert Cards.contains?(deck, card_6) == true
  end

  test "deal function can create a tuple of hand List and rest of deck List" do
    deck = Cards.create_deck
    { hand, rest_of_deck } = Cards.deal(deck, 3)

    assert Enum.count(hand) == 3
    assert Enum.count(rest_of_deck) == 9
  end

  test "create a hand from nothing" do
    {hand, _other_cards} = Cards.create_hand(2)

    assert Enum.count(hand) == 2
  end
end
