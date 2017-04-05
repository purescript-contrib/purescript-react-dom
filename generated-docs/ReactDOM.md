## Module ReactDOM

#### `render`

``` purescript
render :: forall eff. ReactElement -> Element -> Eff (dom :: DOM | eff) (Maybe ReactComponent)
```

Render a React element in a document element. Returns Nothing for stateless components.

#### `unmountComponentAtNode`

``` purescript
unmountComponentAtNode :: forall eff. Element -> Eff (dom :: DOM | eff) Boolean
```

Removes a mounted React element in a document element.
Returns true if it was unmounted, false otherwise.

#### `findDOMNode`

``` purescript
findDOMNode :: forall eff. ReactComponent -> Eff (dom :: DOM | eff) Element
```

Finds the DOM node rendered by the component.

#### `renderToString`

``` purescript
renderToString :: ReactElement -> String
```

Render a React element as a string.

#### `renderToStaticMarkup`

``` purescript
renderToStaticMarkup :: ReactElement -> String
```

Render a React element as static markup string without extra DOM attributes.


