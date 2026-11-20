{{flutter_js}}
{{flutter_build_config}}

// Until Nov 2026 firebase.json served *.js as "immutable" for a year, so
// browsers that visited back then hold a main.dart.js they never re-check.
// Requesting it under a new URL gets them the current build. JS is now
// served no-cache (revalidated by ETag), so this value never needs to change
// per deploy — only if a long-lived cache rule is ever reintroduced.
(function () {
  _flutter.buildConfig.builds.forEach(function (build) {
    if (build.mainJsPath) build.mainJsPath += "?v=2";
  });
  _flutter.loader.load({
    serviceWorkerSettings: {
      serviceWorkerVersion: {{flutter_service_worker_version}},
    },
  });
})();
