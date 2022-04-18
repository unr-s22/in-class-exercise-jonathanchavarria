defmodule Manager.Management.Status do
  use Ecto.Schema
  import Ecto.Changeset
  alias Manager.Management.Assignment

  schema "statuses" do
    field :name, :string
    has_many :assignments, Assignment
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
  def changeset(status, attrs) do
    status
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
