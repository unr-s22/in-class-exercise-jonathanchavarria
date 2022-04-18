defmodule ManagerWeb.AssignmentController do
  use ManagerWeb, :controller

  alias Manager.Management
  alias Manager.Management.Assignment

  def index(conn, _params) do
    assignments = Management.list_assignments()
    render(conn, "index.html", assignments: assignments)
  end

  def new(conn, _params) do
    changeset = Management.change_assignment(%Assignment{})
    statuses = Management.list_statuses()
    render(conn, "new.html", changeset: changeset, statuses: statuses)
  end

  def create(conn, %{"assignment" => assignment_params}) do
    case Management.create_assignment(assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment created successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    assignment = Management.get_assignment!(id)
    render(conn, "show.html", assignment: assignment)
  end

  def edit(conn, %{"id" => id}) do
    assignment = Management.get_assignment!(id)
    changeset = Management.change_assignment(assignment)
    statuses = Management.list_statuses()
    render(conn, "edit.html", assignment: assignment, changeset: changeset, statuses: statuses)
  end

  def update(conn, %{"id" => id, "assignment" => assignment_params}) do
    assignment = Management.get_assignment!(id)

    case Management.update_assignment(assignment, assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment updated successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", assignment: assignment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    assignment = Management.get_assignment!(id)
    {:ok, _assignment} = Management.delete_assignment(assignment)

    conn
    |> put_flash(:info, "Assignment deleted successfully.")
    |> redirect(to: Routes.assignment_path(conn, :index))
  end
end
