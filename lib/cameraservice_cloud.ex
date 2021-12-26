defmodule CameraserviceCloud do
  # code that performs filter
  def ip_not_listed_7_days do
    # get list of ips
    # seconds_in_seven_days = 604_800
    # ips = File.read!("hardcodedList.txt")

    # start the purge of ips not seen last 7 days every hour
    # ips
    # # We split the log file, line by line
    # |> String.split("\n")
    # # Then every element of the list (a line), we split it again into two:
    # # the first part is the IP address, the rest is the time
    # |> Enum.map(fn line ->
    #   String.split(line, " ", parts: 2)
    # end)
    # |> tap(&IO.inspect/1)
    # The code will work as expected upto here., from here down you will have to fix it.
    # |> Enum.map(fn [a, b, c] ->
    #   {:ok, dt, _} = DateTime.from_iso8601(b <> "T" <> c)
    #   {a, dt}
    # end)

#     IO.inspect(ips)
#    our_ips =  ips  |> String.split("\n") |> Enum.map(&(String.split(&1, " ", parts: 2))) |>  Enum.map(fn ip ->
#       timestamp = ip |> List.last |> String.replace("\r", "")
#       {ip |> hd, timestamp}
#     end)


# seconds_in_seven_days = 604800
# purged_ip_list =
#   Enum.reject(our_ips, fn {_ip, timestamp} ->
#     {:ok, timestamp, _offset} = DateTime.from_iso8601(timestamp)
#     DateTime.diff(timestamp, DateTime.utc_now) > seconds_in_seven_days
 # end)

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
