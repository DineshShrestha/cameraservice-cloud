defmodule CameraserviceCloud do
  # code that performs filter
  def ip_not_listed_7_days do
    # get list of ips
    # seconds_in_seven_days = 604_800
    ips = File.read!("hardcodedList.txt")
    # start the purge of ips not seen last 7 days every hour
    ips
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      String.split(x, " ")
    end)
    |> Enum.map(fn [a, b, c] ->
      {:ok, dt, _} = DateTime.from_iso8601(b <> "T" <> c)
      {a, dt}
    end)

    IO.inspect(ips)

    # input
    # |> Enum.filter(ips, fn (ip, timestamp)-> )
    # |> Enum.uniq_by()
    # |> Enum.map(&elem(&1, 0))
    # ips
    # |> String.split(~r/\W/, trim: true)
    # |> Enum.reject(fn {_ip, timestamp} ->
    #   DateTime.diff(timestamp, DateTime.utc_now()) > seconds_in_seven_days
    # end)
  end
end
