defmodule Manager.ManagementTest do
  use Manager.DataCase

  alias Manager.Management

  describe "areas" do
    alias Manager.Management.Area

    import Manager.ManagementFixtures

    @invalid_attrs %{name: nil}

    test "list_areas/0 returns all areas" do
      area = area_fixture()
      assert Management.list_areas() == [area]
    end

    test "get_area!/1 returns the area with given id" do
      area = area_fixture()
      assert Management.get_area!(area.id) == area
    end

    test "create_area/1 with valid data creates a area" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Area{} = area} = Management.create_area(valid_attrs)
      assert area.name == "some name"
    end

    test "create_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_area(@invalid_attrs)
    end

    test "update_area/2 with valid data updates the area" do
      area = area_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Area{} = area} = Management.update_area(area, update_attrs)
      assert area.name == "some updated name"
    end

    test "update_area/2 with invalid data returns error changeset" do
      area = area_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_area(area, @invalid_attrs)
      assert area == Management.get_area!(area.id)
    end

    test "delete_area/1 deletes the area" do
      area = area_fixture()
      assert {:ok, %Area{}} = Management.delete_area(area)
      assert_raise Ecto.NoResultsError, fn -> Management.get_area!(area.id) end
    end

    test "change_area/1 returns a area changeset" do
      area = area_fixture()
      assert %Ecto.Changeset{} = Management.change_area(area)
    end
  end

  describe "devs" do
    alias Manager.Management.Dev

    import Manager.ManagementFixtures

    @invalid_attrs %{email: nil, first_name: nil, last_name: nil}

    test "list_devs/0 returns all devs" do
      dev = dev_fixture()
      assert Management.list_devs() == [dev]
    end

    test "get_dev!/1 returns the dev with given id" do
      dev = dev_fixture()
      assert Management.get_dev!(dev.id) == dev
    end

    test "create_dev/1 with valid data creates a dev" do
      valid_attrs = %{email: "some email", first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Dev{} = dev} = Management.create_dev(valid_attrs)
      assert dev.email == "some email"
      assert dev.first_name == "some first_name"
      assert dev.last_name == "some last_name"
    end

    test "create_dev/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_dev(@invalid_attrs)
    end

    test "update_dev/2 with valid data updates the dev" do
      dev = dev_fixture()
      update_attrs = %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Dev{} = dev} = Management.update_dev(dev, update_attrs)
      assert dev.email == "some updated email"
      assert dev.first_name == "some updated first_name"
      assert dev.last_name == "some updated last_name"
    end

    test "update_dev/2 with invalid data returns error changeset" do
      dev = dev_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_dev(dev, @invalid_attrs)
      assert dev == Management.get_dev!(dev.id)
    end

    test "delete_dev/1 deletes the dev" do
      dev = dev_fixture()
      assert {:ok, %Dev{}} = Management.delete_dev(dev)
      assert_raise Ecto.NoResultsError, fn -> Management.get_dev!(dev.id) end
    end

    test "change_dev/1 returns a dev changeset" do
      dev = dev_fixture()
      assert %Ecto.Changeset{} = Management.change_dev(dev)
    end
  end

  describe "tasks" do
    alias Manager.Management.Task

    import Manager.ManagementFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Management.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Management.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Task{} = task} = Management.create_task(valid_attrs)
      assert task.description == "some description"
      assert task.name == "some name"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Task{} = task} = Management.update_task(task, update_attrs)
      assert task.description == "some updated description"
      assert task.name == "some updated name"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_task(task, @invalid_attrs)
      assert task == Management.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Management.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Management.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Management.change_task(task)
    end
  end

  describe "assignments" do
    alias Manager.Management.Assignment

    import Manager.ManagementFixtures

    @invalid_attrs %{due_date: nil, name: nil, status: nil}

    test "list_assignments/0 returns all assignments" do
      assignment = assignment_fixture()
      assert Management.list_assignments() == [assignment]
    end

    test "get_assignment!/1 returns the assignment with given id" do
      assignment = assignment_fixture()
      assert Management.get_assignment!(assignment.id) == assignment
    end

    test "create_assignment/1 with valid data creates a assignment" do
      valid_attrs = %{due_date: "some due_date", name: "some name", status: "some status"}

      assert {:ok, %Assignment{} = assignment} = Management.create_assignment(valid_attrs)
      assert assignment.due_date == "some due_date"
      assert assignment.name == "some name"
      assert assignment.status == "some status"
    end

    test "create_assignment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_assignment(@invalid_attrs)
    end

    test "update_assignment/2 with valid data updates the assignment" do
      assignment = assignment_fixture()
      update_attrs = %{due_date: "some updated due_date", name: "some updated name", status: "some updated status"}

      assert {:ok, %Assignment{} = assignment} = Management.update_assignment(assignment, update_attrs)
      assert assignment.due_date == "some updated due_date"
      assert assignment.name == "some updated name"
      assert assignment.status == "some updated status"
    end

    test "update_assignment/2 with invalid data returns error changeset" do
      assignment = assignment_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_assignment(assignment, @invalid_attrs)
      assert assignment == Management.get_assignment!(assignment.id)
    end

    test "delete_assignment/1 deletes the assignment" do
      assignment = assignment_fixture()
      assert {:ok, %Assignment{}} = Management.delete_assignment(assignment)
      assert_raise Ecto.NoResultsError, fn -> Management.get_assignment!(assignment.id) end
    end

    test "change_assignment/1 returns a assignment changeset" do
      assignment = assignment_fixture()
      assert %Ecto.Changeset{} = Management.change_assignment(assignment)
    end
  end

  describe "statuses" do
    alias Manager.Management.Status

    import Manager.ManagementFixtures

    @invalid_attrs %{name: nil}

    test "list_statuses/0 returns all statuses" do
      status = status_fixture()
      assert Management.list_statuses() == [status]
    end

    test "get_status!/1 returns the status with given id" do
      status = status_fixture()
      assert Management.get_status!(status.id) == status
    end

    test "create_status/1 with valid data creates a status" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Status{} = status} = Management.create_status(valid_attrs)
      assert status.name == "some name"
    end

    test "create_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_status(@invalid_attrs)
    end

    test "update_status/2 with valid data updates the status" do
      status = status_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Status{} = status} = Management.update_status(status, update_attrs)
      assert status.name == "some updated name"
    end

    test "update_status/2 with invalid data returns error changeset" do
      status = status_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_status(status, @invalid_attrs)
      assert status == Management.get_status!(status.id)
    end

    test "delete_status/1 deletes the status" do
      status = status_fixture()
      assert {:ok, %Status{}} = Management.delete_status(status)
      assert_raise Ecto.NoResultsError, fn -> Management.get_status!(status.id) end
    end

    test "change_status/1 returns a status changeset" do
      status = status_fixture()
      assert %Ecto.Changeset{} = Management.change_status(status)
    end
  end
end
