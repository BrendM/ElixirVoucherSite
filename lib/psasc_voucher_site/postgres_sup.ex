defmodule PsascVoucherSite.PostgresSup do
  @moduledoc false
  import Supervisor.Spec, warn: false

    def start_link do
      Supervisor.start_link(__MODULE__, :ok)
    end

    def init(:ok) do
      children = [
          supervisor(PsascVoucherSite.Repo, []),
        ]

      supervise(children, strategy: :one_for_one)
    end
  
end