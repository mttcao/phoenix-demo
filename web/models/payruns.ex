defmodule HelloPhoenix.Payruns do
  use HelloPhoenix.Web, :model

  schema "payruns" do
    field :startdate, Ecto.Date
    field :enddate, Ecto.Date
    field :payondate, Ecto.Date

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:startdate, :enddate, :payondate])
    |> validate_required([:startdate, :enddate, :payondate])
  end
end
