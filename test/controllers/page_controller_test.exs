defmodule Teacher.PageControllerTest do
  use Teacher.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "<h2>Listing movies</h2>"
  end
end
