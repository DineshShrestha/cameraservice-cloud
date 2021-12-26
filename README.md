# CameraserviceCloud

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cameraservice_cloud` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cameraservice_cloud, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/cameraservice_cloud](https://hexdocs.pm/cameraservice_cloud).

Right now we have the camerafeed via cloud solution open for all IPs (the entire Internet) given having username/password. We really should only accept IPs that we know or previously have seen as users of Mat Norge RMA app.

Create a feature/dynamic-firewall branch based on master
1.  Start by having a hardcoded list, upon accepting a connection do a lookup to see if that IP is in that list of accepted IPs, and if not reject the connection. Commit this as the first      
    commit for this task and create a PR, link that PR to this task and let's have a discussion in the PR about the implementation details/process #4
2. Expand from the hardcoded list to a list of IPs provided by a Agent, each IP should have a timestamp for when was last seen
3. Create a module started by application.ex that each hour, starts a purge of IPs not seen last 7 days from the list
4. Create a secure (need api-key http header) endpoint where an IP can be POSTED to have that IP added or refreshed to the list
5. Create a secure (need api-key http header) endpoint where the current list of IPs and their timestamp can be printed out (one ip timestamp per line?)
6. Upon shutdown, serialize the IPs and timestamps to a .json file and read that file upon startup (look at how dashboard state is being written/read in hegna-landhandel-core)
7. Stretch goal: for an unknown IP that is not in the list, do a country lookup based on https://ip-api.com/ and if the IP it is in Norway, add it to the list