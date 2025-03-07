defmodule Pod1.Counter.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl Supervisor
  def init(_opts \\ []) do
    children = [
      {Pod1.Counter, 0}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
