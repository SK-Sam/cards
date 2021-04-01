defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """
  def create_deck do
    values = ["Ace", "Two", "Three"]
    suits = ["Spades", "Diamonds", "Hearts", "Clubs"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle_deck(deck) do
    shuffled = Enum.shuffle(deck)

    if shuffled == deck do
      shuffle_deck(deck)
    else
      shuffled
    end
  end

  def contains?(deck, card) do
    card in deck
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
