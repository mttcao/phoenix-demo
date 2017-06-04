defmodule HelloPhoenix.Repo.Migrations.CreatePayruns do
  use Ecto.Migration

  def change do
    create table(:payruns) do
      add :startdate, :date
      add :enddate, :date
      add :payondate, :date

      timestamps()
    end

  end
end
