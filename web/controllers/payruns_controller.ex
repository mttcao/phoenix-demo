alias HelloPhoenix.Repo
alias HelloPhoenix.Payruns

defmodule HelloPhoenix.PayrunController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    # payruns = [
    #
    #   %{startdate: "20/01/17",
    #     enddate: "27/01/17",
    #     date: "2/01/17"},
    #
    #   %{startdate: "13/01/17",
    #     enddate: "20/01/17",
    #     date: "21/01/17"},
    #
    # ]

    payruns = Repo.all(Payruns)
    json conn, payruns
  end

end
