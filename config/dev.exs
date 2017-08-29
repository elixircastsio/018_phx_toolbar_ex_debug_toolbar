use Mix.Config

config :ex_debug_toolbar,
  enable: true

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :teacher, TeacherWeb.Endpoint,
  http: [port: 4000],
  instrumenters: [ExDebugToolbar.Collector.InstrumentationCollector],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../assets", __DIR__)]]


# Watch static and templates for browser reloading.
config :teacher, TeacherWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/teacher_web/views/.*(ex)$},
      ~r{lib/teacher_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

config :phoenix, :template_engines,
  eex: ExDebugToolbar.Template.EExEngine,
  exs: ExDebugToolbar.Template.ExsEngine

# Configure your database
config :teacher, Teacher.Repo,
  adapter: Ecto.Adapters.Postgres,
  loggers: [ExDebugToolbar.Collector.EctoCollector, Ecto.LogEntry],
  username: "postgres",
  password: "postgres",
  database: "teacher_dev",
  hostname: "localhost",
  pool_size: 10
