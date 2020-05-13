# Realtime

Powered by the wonderful Phoenix Framework.

The real magic happens in

 - `./lib/realtime_web/live/page_live.ex`
 - `./lib/realtime_web/live/page_live.html.leex`

A couple more lines in

 - `lib/realtime/store/store.ex`
 - `lib/realtime/store/supervisor.ex`

Most of the rest is generated and bootstrapped by `mix phx.new`.

## Development Setup

To start your Phoenix server:

  * Setup the project with `mix setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Deployment

A `Dockerfile` and `docker-compose.yml` exists for release and deployment.

Build a new release, run:

```
docker-compose build
```


## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
  * Deployment guides: https://hexdocs.pm/phoenix/deployment.html
