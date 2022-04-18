defmodule Manager.Management.Area do
  use Ecto.Schema
  import Ecto.Changeset
  alias Manager.Management.{Dev, Task}

  schema "areas" do
    field :name, :string
    has_many :devs, Dev
    has_many :tasks, Task
    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(area, attrs) do
    area
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
