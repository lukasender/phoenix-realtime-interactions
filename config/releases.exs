import Config

config :realtime, RealtimeWeb.Endpoint,
  # If you are doing OTP releases, you need to instruct Phoenix
  # to start each relevant endpoint:
  server: true,
  url: [
    scheme: System.get_env("RT_ENDPOINT_SCHEME") || "http",
    host: System.get_env("RT_ENDPOINT_HOSTNAME") || "localhost",
    port: String.to_integer(System.get_env("RT_ENDPOINT_PORT")) || 4000,
    path: System.get_env("RT_ENDPOINT_PATH") || "/",
  ]

config :realtime, :web,
   url: System.get_env("RT_WEB_URL") || "https://interactions.lukasender.at"

# Do not print debug messages in production
config :logger, level: String.to_atom(System.get_env("RT_LOGGER_LEVEL") || "info")

# config :mensia, :dir, '/mounts/mnesia/'

secret_key_base =
  System.get_env("RT_SECRET_KEY_BASE") ||
    raise """
    environment variable RT_SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :realtime, RealtimeWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("RT_PORT") || "4000")],
  secret_key_base: secret_key_base
