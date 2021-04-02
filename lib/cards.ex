defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  def create_hand(hand_size) do
    create_deck()
    |> shuffle_deck
    |> deal(hand_size)
  end

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

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def read(filename) do
    #{status, binary} = File.read(filename)

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end
end
