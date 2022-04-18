defmodule Manager.Repo.Migrations.CreateAssignments do
  use Ecto.Migration

  def change do
    create table(:assignments) do
      add :name, :string
      add :due_date, :string

      add :dev_id, references(:devs, on_delete: :nothing)
      add :task_id, references(:tasks, on_delete: :nothing)
      add :status_id, references(:statuses, on_delete: :nothing)

      timestamps()
    end

    create index(:assignments, [:status_id])
    create index(:assignments, [:dev_id])
    create index(:assignments, [:task_id])
  end
end
