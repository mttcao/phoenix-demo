defmodule HelloPhoenix.Payrun do
  use HelloPhoenix.Web, :model

  schema "payrun" do
    field :start_date, :date
    field :end_date, :date
    field :pay_on_date, :date

    timestamps()
  end
end
