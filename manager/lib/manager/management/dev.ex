defmodule Manager.Management.Dev do
  use Ecto.Schema
  import Ecto.Changeset
  alias Manager.Management.{Area, Assignment}

  @derive {Jason.Encoder, only: [:zipcode]}
  schema "devs" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    belongs_to :area, Area
    has_many(:assignments, Assignment)
    #many_to_many(:tasks, Task, join_through: Assignment)
    has_many(:tasks, through: [:assignments, :task])
    field :zipcode, :string
    timestamps()
  end

  def get_by_zipcode(dev) do
    {:ok, response} = HTTPoison.get("https://service.zipapi.us/zipcode/#{dev.zipcode}/?X-API-KEY=js-4acdd934bfbe640b576ac163cf66badd")
    IO.inspect(response)
    {:ok, values} = Jason.decode(response.body)
    values
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
  def changeset(dev, attrs) do
    dev
    |> cast(attrs, [:first_name, :last_name, :email, :area_id, :zipcode])
    |> validate_required([:first_name, :last_name, :email, :area_id])
  end
end
