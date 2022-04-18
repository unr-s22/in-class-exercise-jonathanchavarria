defmodule Manager.ManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Manager.Management` context.
  """

  @doc """
  Generate a area.
  """
  def area_fixture(attrs \\ %{}) do
    {:ok, area} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Manager.Management.create_area()

    area
  end

  @doc """
  Generate a dev.
  """
  def dev_fixture(attrs \\ %{}) do
    {:ok, dev} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> Manager.Management.create_dev()

    dev
  end

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Manager.Management.create_task()

    task
  end

  @doc """
  Generate a assignment.
  """
  def assignment_fixture(attrs \\ %{}) do
    {:ok, assignment} =
      attrs
      |> Enum.into(%{
        due_date: "some due_date",
        name: "some name",
        status: "some status"
      })
      |> Manager.Management.create_assignment()

    assignment
  end

  @doc """
  Generate a status.
  """
  def status_fixture(attrs \\ %{}) do
    {:ok, status} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Manager.Management.create_status()

    status
  end
end
