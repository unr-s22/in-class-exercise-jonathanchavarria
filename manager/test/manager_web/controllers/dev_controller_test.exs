defmodule ManagerWeb.DevControllerTest do
  use ManagerWeb.ConnCase

  import Manager.ManagementFixtures

  @create_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name"}
  @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name"}
  @invalid_attrs %{email: nil, first_name: nil, last_name: nil}

  describe "index" do
    test "lists all devs", %{conn: conn} do
      conn = get(conn, Routes.dev_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Devs"
    end
  end

  describe "new dev" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.dev_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dev"
    end
  end

  describe "create dev" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dev_path(conn, :create), dev: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.dev_path(conn, :show, id)

      conn = get(conn, Routes.dev_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dev"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dev_path(conn, :create), dev: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dev"
    end
  end

  describe "edit dev" do
    setup [:create_dev]

    test "renders form for editing chosen dev", %{conn: conn, dev: dev} do
      conn = get(conn, Routes.dev_path(conn, :edit, dev))
      assert html_response(conn, 200) =~ "Edit Dev"
    end
  end

  describe "update dev" do
    setup [:create_dev]

    test "redirects when data is valid", %{conn: conn, dev: dev} do
      conn = put(conn, Routes.dev_path(conn, :update, dev), dev: @update_attrs)
      assert redirected_to(conn) == Routes.dev_path(conn, :show, dev)

      conn = get(conn, Routes.dev_path(conn, :show, dev))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, dev: dev} do
      conn = put(conn, Routes.dev_path(conn, :update, dev), dev: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dev"
    end
  end

  describe "delete dev" do
    setup [:create_dev]

    test "deletes chosen dev", %{conn: conn, dev: dev} do
      conn = delete(conn, Routes.dev_path(conn, :delete, dev))
      assert redirected_to(conn) == Routes.dev_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.dev_path(conn, :show, dev))
      end
    end
  end

  defp create_dev(_) do
    dev = dev_fixture()
    %{dev: dev}
  end
end
