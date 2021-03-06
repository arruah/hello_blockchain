defmodule HelloBlockchainWeb.Router do
  use HelloBlockchainWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloBlockchainWeb do
    pipe_through :browser # Use the default browser stack
    resources "/", PageController, only: [:index]
    resources "/blocks", BlockController, only: [:index, :show]
    resources "/headers", HeaderController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloBlockchainWeb do
  #   pipe_through :api
  # end
end
