defmodule Purger do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_) do
    Process.send_after(self(), :purge_ips, 7200)

    {:ok, %{}}
  end

  def handle_info(:purge_ips, _state) do
    ## add the new code here
    ips = File.read!("hardcodedList.txt")

    our_ips =
      ips
      |> String.split("\n")
      |> Enum.map(&String.split(&1, " ", parts: 2))
      |> Enum.map(fn ip ->
        timestamp = ip |> List.last() |> String.replace("\r", "")
        {ip |> hd, timestamp}
      end)

    seconds_in_seven_days = 604_800

    purged_ip_list =
      Enum.reject(our_ips, fn {_ip, timestamp} ->
        {:ok, timestamp, _offset} = DateTime.from_iso8601(timestamp)
        DateTime.diff(timestamp, DateTime.utc_now()) > seconds_in_seven_days
      end)
      |> IO.inspect()

    Process.send_after(self(), :purge_ips, 7200)

    {:noreply, %{}}
  end
end
