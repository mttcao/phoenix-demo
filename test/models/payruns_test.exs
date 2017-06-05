defmodule HelloPhoenix.PayrunTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Payrun

  @valid_attrs %{enddate: %{day: 17, month: 4, year: 2010}, payondate: %{day: 17, month: 4, year: 2010}, startdate: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Payrun.changeset(%Payrun{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Payrun.changeset(%Payrun{}, @invalid_attrs)
    refute changeset.valid?
  end
end
