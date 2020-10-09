{ name = "react-dom"
, dependencies = [ "console", "effect", "psci-support", "react", "web-dom" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
