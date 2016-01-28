defmodule TwitterPlayground.Channels.Tweets do
  use Phoenix.Channel
  alias TwitterPlayground.TweetStreamer

  def join(socket, "stream", %{"track" => query}) do
    reply socket, "join", %{status: "connected"}
    spawn(fn() -> TweetStreamer.start(socket, query) end)
    {:ok, socket}
  end
end
