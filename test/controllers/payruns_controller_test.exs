defmodule HelloPhoenix.PayrunsControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.Payruns
  @valid_attrs %{enddate: %{day: 17, month: 4, year: 2010}, payondate: %{day: 17, month: 4, year: 2010}, startdate: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, payruns_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing payruns"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, payruns_path(conn, :new)
    assert html_response(conn, 200) =~ "New payruns"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, payruns_path(conn, :create), payruns: @valid_attrs
    assert redirected_to(conn) == payruns_path(conn, :index)
    assert Repo.get_by(Payruns, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, payruns_path(conn, :create), payruns: @invalid_attrs
    assert html_response(conn, 200) =~ "New payruns"
  end

  test "shows chosen resource", %{conn: conn} do
    payruns = Repo.insert! %Payruns{}
    conn = get conn, payruns_path(conn, :show, payruns)
    assert html_response(conn, 200) =~ "Show payruns"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, payruns_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    payruns = Repo.insert! %Payruns{}
    conn = get conn, payruns_path(conn, :edit, payruns)
    assert html_response(conn, 200) =~ "Edit payruns"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    payruns = Repo.insert! %Payruns{}
    conn = put conn, payruns_path(conn, :update, payruns), payruns: @valid_attrs
    assert redirected_to(conn) == payruns_path(conn, :show, payruns)
    assert Repo.get_by(Payruns, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    payruns = Repo.insert! %Payruns{}
    conn = put conn, payruns_path(conn, :update, payruns), payruns: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit payruns"
  end

  test "deletes chosen resource", %{conn: conn} do
    payruns = Repo.insert! %Payruns{}
    conn = delete conn, payruns_path(conn, :delete, payruns)
    assert redirected_to(conn) == payruns_path(conn, :index)
    refute Repo.get(Payruns, payruns.id)
  end
end
