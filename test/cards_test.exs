defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck can create a list of strings" do
    assert Cards.create_deck == ["Ace", "Two", "Three"]
  end
end
