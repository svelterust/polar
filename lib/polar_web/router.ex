defmodule PolarWeb.Router do
  use PolarWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PolarWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Inertia.Plug
  end

  scope "/", PolarWeb do
    pipe_through :browser

    get "/", PageController, :items_page
    post "/", PageController, :items
  end
end
