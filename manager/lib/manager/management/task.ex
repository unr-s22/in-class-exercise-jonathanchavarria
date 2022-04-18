defmodule Manager.Management.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Manager.Management.{Area, Assignment}

  schema "tasks" do
    field :description, :string
    field :name, :string
    belongs_to :area, Area
    has_many(:assignments, Assignment)
    has_many(:devs, through: [:assignments, :dev])

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :description, :area_id])
    |> validate_required([:name, :description, :area_id])
  end
end
