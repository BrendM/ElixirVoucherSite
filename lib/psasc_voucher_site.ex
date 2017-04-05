defmodule PsascVoucherSite do
require Logger
  @moduledoc """
  Documentation for PsascVoucherSite.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PsascVoucherSite.hello
      :world

  """
  def start do
    Plug.Adapters.Cowboy.http SiteRouter, []
    Logger.info "Http started on port 4000"
    PsascVoucherSite.PostgresSup.start_link()
    Logger.info "Database link started"
  end
end
