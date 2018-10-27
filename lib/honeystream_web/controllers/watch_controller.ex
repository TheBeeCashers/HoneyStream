defmodule HoneystreamWeb.WatchController do
  use HoneystreamWeb, :controller

  alias Honeystream.Videos
  alias Honeystream.Videos.Video

  action_fallback HoneystreamWeb.FallbackController

  def stream(conn, %{"id" => id}) do
    video = Videos.get_video!(id)
    file_path = "videos/" <> video.path_high
    offset = get_offset(conn.req_headers)
    file_size = get_file_size(file_path)
  
    conn
    |> Plug.Conn.put_resp_header("content-type", video.content_type)
    |> Plug.Conn.put_resp_header("content-range", "bytes #{offset}-#{file_size-1}/#{file_size}")
    |> Plug.Conn.send_file(206, file_path, offset, file_size - offset)
  end

  defp get_offset(headers) do
    case List.keyfind(headers, "range", 0) do
      {"range", "bytes=" <> start_pos} ->
        String.split(start_pos, "-") |> hd |> String.to_integer
      nil ->
        0
    end
  end

  def get_file_size(path) do
    {:ok, %{size: size}} = File.stat path
    size
  end
end
