defmodule CaptureLogConfigReproductionTest do
  use ExUnit.Case

  import ExUnit.CaptureLog
  doctest CaptureLogConfigReproduction

  test "greets the world" do
    log = capture_log([format: "$message\n"], fn -> CaptureLogConfigReproduction.hello() end)

    assert log == "This is a log\n"
  end
end
