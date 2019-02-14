require "test_helper"

class ::Harness::CircuitboxTest < ::MiniTest::Test
  def test_logs_circuit_open
    instrument("circuit_open", circuit: "test_circuit")

    assert_increment "circuitbox.test_circuit.circuit_open"
  end

  def test_logs_circuit_close
    instrument("circuit_close", circuit: "test_circuit")

    assert_increment "circuitbox.test_circuit.circuit_close"
  end

  def test_measures_circuit_close_time
    gauge("circuit_gauge", :circuit => "test_circuit",:gauge => "execution_time", :value => 4)

    assert_gauge "circuitbox.circuit.test_circuit.execution_time"
  end
end
