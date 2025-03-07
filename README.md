# Pod1

POC of an elixir application in a clusterized setting using libcluster to
discover and talk to other nodes and `horde` to share processes among them.

## Installation / Usage

``` sh
mix deps.get
mix compile
```

In two different terminals run

``` sh
iex --sname n1 -S mix
```

``` sh
iex --sname n2 -S mix
```

Now you can increment the counter in one node and see it in the other!

``` sh
# Node 1
iex(n1@lHost)1> Pos1.Counter.count()
# 0
```

``` sh
# Node 2
iex(n1@lHost)1> Pos1.Counter.count()
# 0
iex(n1@lHost)1> Pos1.Counter.inc()
# :ok
iex(n1@lHost)1> Pos1.Counter.inc()
# :ok
iex(n1@lHost)1> Pos1.Counter.inc()
# :ok
```

``` sh
# Node 1
iex(n1@lHost)1> Pos1.Counter.count()
# 3
```
