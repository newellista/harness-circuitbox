require "harness"

%w(circuit_open circuit_close).each do |event_name|
  ::ActiveSupport::Notifications.subscribe(event_name) do |_name, _start, _finish, _id, payload|
    circuit_name = payload.fetch(:circuit, "UNKNOWN_CIRCUIT")

    ::Harness.increment "circuitbox.#{circuit_name}.#{event_name}"
  end
end

::ActiveSupport::Notifications.subscribe("circuit_gauge") do |_name, _start, _finish, _id, payload|
  circuit_name = payload.fetch(:circuit, "UNKNOWN_CIRCUIT")
  gauge = payload.fetch(:gauge, "UNKNOWN_GAUGE")
  value = payload.fetch(:value, "UNKNOWN_VALUE")

  metrics_key = "circuitbox.circuit.#{circuit_name}.#{gauge}"

  ::Harness.gauge(metrics_key, value)
end
