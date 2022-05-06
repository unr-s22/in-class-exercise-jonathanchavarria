defmodule Manager.Repo.Migrations.AddZipcodeToDevs do
  use Ecto.Migration

  def change do
    alter table(:devs) do
      add :zipcode, :string

    end
  end
end
