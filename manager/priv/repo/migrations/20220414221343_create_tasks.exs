defmodule Manager.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :description, :string
      add :area_id, references(:areas, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:area_id])
  end
end
