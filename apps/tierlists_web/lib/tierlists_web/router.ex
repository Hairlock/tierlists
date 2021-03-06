defmodule TierlistsWeb.Router do
  use TierlistsWeb, :router

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

  scope "/", TierlistsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api/v1/", TierlistsWeb do
    pipe_through :api

    resources "/users", UserController, only: [:create]
    resources "/sessions", SessionController, only: [:create]    
  end

  scope "/info", TierlistsWeb do
    pipe_through :browser

    get "/about", InfoController, :about
  end

  scope "/admin", TierlistsWeb.Admin, as: :admin do
    pipe_through :browser
    
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TierlistsWeb do
  #   pipe_through :api
  # end
end
