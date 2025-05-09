defmodule Polar.Repo do
  use Ecto.Repo,
    otp_app: :polar,
    adapter: Ecto.Adapters.SQLite3
end
