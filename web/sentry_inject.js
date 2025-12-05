if (typeof Sentry !== "undefined") {
  Sentry.init({
    dsn: "YOUR_SENTRY_DSN",
    tracesSampleRate: 1.0,
  });

  window.addEventListener("error", (event) => {
    Sentry.captureException(event.error || event.message);
  });

  window.addEventListener("unhandledrejection", (event) => {
    Sentry.captureException(event.reason || "Unhandled Promise Rejection");
  });
}
