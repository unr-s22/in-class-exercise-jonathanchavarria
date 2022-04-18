defmodule Manager.Management.Assignment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Manager.Management.{Status, Dev, Task}

  schema "assignments" do
    field :due_date, :string
    field :name, :string
    belongs_to :status, Status
    belongs_to(:dev, Dev)
    belongs_to(:task, Task)

    timestamps()
  end

  @doc false
def changeset(assignment, attrs) do
    assignment
    |> cast(attrs, [:name, :due_date, :dev_id ,:status_id, :task_id])
    |> validate_required([:name, :due_date, :status_id])
  end
end
