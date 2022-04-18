defmodule Manager.Repo.Migrations.CreateDevs do
  use Ecto.Migration

  def change do
    create table(:devs) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :area_id, references(:areas, on_delete: :nothing)

      timestamps()
    end

    create index(:devs, [:area_id])
  end
end
