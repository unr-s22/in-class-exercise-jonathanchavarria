defmodule ManagerWeb.TaskController do
  use ManagerWeb, :controller

  alias Manager.Management
  alias Manager.Management.Task

  def index(conn, _params) do
    tasks = Management.list_tasks()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Management.change_task(%Task{})
    areas = Management.list_areas()
    render(conn, "new.html", changeset: changeset, areas: areas)
  end

  def create(conn, %{"task" => task_params}) do
    case Management.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Management.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, %{"id" => id}) do
    task = Management.get_task!(id)
    changeset = Management.change_task(task)
    areas = Management.list_areas()
    render(conn, "edit.html", task: task, changeset: changeset, areas: areas)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Management.get_task!(id)

    case Management.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Management.get_task!(id)
    {:ok, _task} = Management.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
