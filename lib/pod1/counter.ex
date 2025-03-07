defmodule Pod1.Counter do
  @moduledoc """
  Simple Counter module, initializes at 0, increments with an `:inc` message and
  decrements with a `:dec` message. Returns the current count with a `:count`
  message.
  """

  use GenServer

  def start_link(init_args, opts \\ []) do
    GenServer.start_link(__MODULE__, init_args, opts)
  end

  def inc() do
    GenServer.cast({:via, Horde.Registry, {Pod1.Registry, :counter}}, :inc)
  end

  def dec() do
    GenServer.cast({:via, Horde.Registry, {Pod1.Registry, :counter}}, :dec)
  end

  @spec count() :: integer()
  def count() do
    GenServer.call({:via, Horde.Registry, {Pod1.Registry, :counter}}, :count)
  end

  @impl GenServer
  def init(initial_value \\ 0) do
    Horde.Registry.register(Pod1.Registry, :counter, "counter")
    {:ok, initial_value}
  end

  @impl GenServer
  def handle_cast(:inc, state) do
    {:noreply, state + 1}
  end

  @impl GenServer
  def handle_cast(:dec, state) do
    {:noreply, state - 1}
  end

  @impl GenServer
  def handle_call(:count, _from, state) do
    {:reply, state, state}
  end
end
