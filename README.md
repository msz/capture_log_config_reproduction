# Elixir 1.15.0 capture_log option bug reproduction

This is a reproduction of an Elixir 1.15.0 bug where `capture_log` options no
longer affect Logger configuration when `capture_log` is set to `true` in ExUnit
configuration.

It sets a custom format through `capture_log` which consists just of the
message. On Elixir 1.14.5, the format is respected, while on Elixir 1.15.0 the
default format is used.

To reproduce, clone this repository and `cd` into it. Then running these
commands should give you the following:

**Elixir 1.14.5**:
```
capture_log_config_reproduction % docker run -v $(pwd):/repro --workdir /repro elixir:1.14.5 mix test --force
Compiling 1 file (.ex)
Generated capture_log_config_reproduction app
..
Finished in 0.03 seconds (0.00s async, 0.03s sync)
1 doctest, 1 test, 0 failures

Randomized with seed 712722

```

**Elixir 1.15.0**:
```
capture_log_config_reproduction % docker run -v $(pwd):/repro --workdir /repro elixir:1.15.0 mix test --force
Compiling 1 file (.ex)
Generated capture_log_config_reproduction app
.

  1) test greets the world (CaptureLogConfigReproductionTest)
     test/capture_log_config_reproduction_test.exs:7
     Assertion with == failed
     code:  assert log == "This is a log\n"
     left:  "\n17:54:11.695 [info] This is a log\n"
     right: "This is a log\n"
     stacktrace:
       test/capture_log_config_reproduction_test.exs:10: (test)

     The following output was logged:

     17:54:11.695 [info] This is a log


Finished in 0.03 seconds (0.00s async, 0.03s sync)
1 doctest, 1 test, 1 failure

Randomized with seed 638954
```
