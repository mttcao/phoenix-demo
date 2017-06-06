alias HelloPhoenix.Repo
alias HelloPhoenix.Payrun

defmodule HelloPhoenix.PayrunController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do

    payruns = Repo.all(Payrun)
    response = Enum.map(payruns, fn(x) -> toPayrunResponse(x) end)

    json conn, response
  end

  def toPayrunResponse(payrun) do
    payrun_map = %{
      data: %{
        type: "payruns",
        id: payrun.id,
        attributes: %{
          startDate: payrun.start_date,
          endDate: payrun.end_date,
          payOnDate: payrun.pay_on_date,
          insertedAt: payrun.inserted_at,
          updatedAt: payrun.updated_at
        }
      }
    }
  end

end
