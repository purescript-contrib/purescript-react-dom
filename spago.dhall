{ name = "react-dom"
, dependencies =
  [ "console"
  , "effect"
  , "functions"
  , "maybe"
  , "nullable"
  , "prelude"
  , "react"
  , "web-dom"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
