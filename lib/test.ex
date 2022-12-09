defmodule Test do
  use Rustler,
    otp_app: :rustler_raise_error,
    crate: :test

  # When loading a NIF module, dummy clauses for all NIF function are required.
  # NIF dummies usually just error out when called when the NIF is not loaded,
  # as that should never normally happen.
  def open(_args), do: :erlang.nif_error(:nif_not_loaded)

  def open_bang(_args), do: :erlang.nif_error(:nif_not_loaded)
end