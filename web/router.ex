defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

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

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    # get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/management", PayrunController
    # resources "/comments", CommentController, only: [:index, :show]
    # resources "/users", UserController do
      # resources "/posts", PostController
    # end
    # resources "/reviews", ReviewController

  end

  scope "/manage", HelloPhoenix do
    pipe_through :api

    get "/payruns", PayrunController, :index
  end
  # scope "/admin", HelloPhoenix.Admin, as: :admin do
  #   pipe_through :browser
  #
  #   resources "/images", ImageController
  #   resources "/reviews", ReviewController
  #   resources "/users", UserController
  # end

  # Other scopes may use custom stacks.
  # scope "/api", HelloPhoenix do
  #   pipe_through :api
  # end
end
