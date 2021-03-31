defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """
  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck)

  #   if shuffled == deck do
  #     shuffled = shuffle_deck(deck)
  #   end
  #   shuffled
  end
end
