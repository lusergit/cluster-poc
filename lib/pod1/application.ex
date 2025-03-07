defmodule Pod1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topology = [
      gossip: [
        strategy: Cluster.Strategy.Gossip
      ]
    ]

    children = [
      {Cluster.Supervisor, [topology, [name: Pod1.Cluster.Supervisor]]},
      {Horde.Registry, [keys: :unique, name: Pod1.Registry, members: :auto]},
      Pod1.Counter.Supervisor
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pod1.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
