defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """
  def create_deck do
    ["Ace", "Two", "Three"]
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
end
