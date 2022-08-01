defmodule Test.Managment.Document do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documents" do


    timestamps()
  end

  @doc false
  def changeset(document, attrs) do
    document
    |> cast(attrs, [])
    |> validate_required([])
  end
end
