defmodule ManagerWeb.DevController do
  use ManagerWeb, :controller

  alias Manager.Management
  alias Manager.Management.Dev

  def index(conn, _params) do
    devs = Management.list_devs()
    render(conn, "index.html", devs: devs)
  end

  def new(conn, _params) do
    changeset = Management.change_dev(%Dev{})
    areas = Management.list_areas()
    render(conn, "new.html", changeset: changeset, areas: areas)
  end

  def create(conn, %{"dev" => dev_params}) do
    case Management.create_dev(dev_params) do
      {:ok, dev} ->
        conn
        |> put_flash(:info, "Dev created successfully.")
        |> redirect(to: Routes.dev_path(conn, :show, dev))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dev = Management.get_dev_with_citystate(id)
    render(conn, :show, dev: dev)
  end

  def edit(conn, %{"id" => id}) do
    dev = Management.get_dev!(id)
    changeset = Management.change_dev(dev)
    areas = Management.list_areas()
    render(conn, "edit.html", dev: dev, changeset: changeset, areas: areas)
  end

  def update(conn, %{"id" => id, "dev" => dev_params}) do
    dev = Management.get_dev!(id)

    case Management.update_dev(dev, dev_params) do
      {:ok, dev} ->
        conn
        |> put_flash(:info, "Dev updated successfully.")
        |> redirect(to: Routes.dev_path(conn, :show, dev))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dev: dev, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dev = Management.get_dev!(id)
    {:ok, _dev} = Management.delete_dev(dev)

    conn
    |> put_flash(:info, "Dev deleted successfully.")
    |> redirect(to: Routes.dev_path(conn, :index))
  end
end
