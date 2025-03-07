defmodule Pod1Test do
  use ExUnit.Case
  doctest Pod1

  test "greets the world" do
    assert Pod1.hello() == :world
  end
end
