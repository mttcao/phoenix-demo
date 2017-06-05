defmodule HelloPhoenix.Repo.Migrations.CreatePayruns do
  use Ecto.Migration

  def change do
    create table(:payrun) do
       add :start_date, :date
       add :end_date, :date
       add :pay_on_date, :date

       timestamps()
     end
  end

end
