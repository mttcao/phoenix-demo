defmodule HelloPhoenix.PayrunControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.Payrun
  @valid_attrs %{enddate: %{day: 17, month: 4, year: 2010}, payondate: %{day: 17, month: 4, year: 2010}, startdate: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, payrun_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing payrun"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, payrun_path(conn, :new)
    assert html_response(conn, 200) =~ "New payrun"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, payrun_path(conn, :create), payrun: @valid_attrs
    assert redirected_to(conn) == payrun_path(conn, :index)
    assert Repo.get_by(Payrun, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, payrun_path(conn, :create), payrun: @invalid_attrs
    assert html_response(conn, 200) =~ "New payrun"
  end

  test "shows chosen resource", %{conn: conn} do
    payruns = Repo.insert! %Payrun{}
    conn = get conn, payrun_path(conn, :show, payrun)
    assert html_response(conn, 200) =~ "Show payrun"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, payrun_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    payruns = Repo.insert! %Payrun{}
    conn = get conn, payrun_path(conn, :edit, payrun)
    assert html_response(conn, 200) =~ "Edit payrun"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    payruns = Repo.insert! %Payrun{}
    conn = put conn, payrun_path(conn, :update, payrun), payrun: @valid_attrs
    assert redirected_to(conn) == payrun_path(conn, :show, payrun)
    assert Repo.get_by(Payrun, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    payruns = Repo.insert! %Payrun{}
    conn = put conn, payrun_path(conn, :update, payrun), payrun: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit payrun"
  end

  test "deletes chosen resource", %{conn: conn} do
    payruns = Repo.insert! %Payrun{}
    conn = delete conn, payrun_path(conn, :delete, payrun)
    assert redirected_to(conn) == payrun_path(conn, :index)
    refute Repo.get(Payrun, payrun.id)
  end
end
