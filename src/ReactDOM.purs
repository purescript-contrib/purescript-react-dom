module ReactDOM
  ( render
  , hydrate
  , unmountComponentAtNode
  , findDOMNode
  , renderToString
  , renderToStaticMarkup
  ) where

import Prelude

import Data.Function.Uncurried (runFn1, Fn1)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import React (ReactElement, ReactComponent)
import Web.DOM.Element (Element)

-- | Render a React element in a document element. Returns Nothing for stateless components.
render
  :: ReactElement
  -> Element
  -> Effect (Maybe ReactComponent)
render rEl el = toMaybe <$> runEffectFn2 renderImpl rEl el

-- | Same as `render`, but is used to hydrate a container whose HTML contents were rendered on the server.
hydrate
  :: ReactElement
  -> Element
  -> Effect (Maybe ReactComponent)
hydrate rEl el = toMaybe <$> runEffectFn2 hydrateImpl rEl el

-- | Removes a mounted React element in a document element.
-- | Returns true if it was unmounted, false otherwise.
unmountComponentAtNode :: Element -> Effect Boolean
unmountComponentAtNode = runEffectFn1 unmountComponentAtNodeImpl

-- | Finds the DOM node rendered by the component.
findDOMNode :: ReactComponent -> Effect Element
findDOMNode = runEffectFn1 findDOMNodeImpl

-- | Render a React element as a string.
renderToString :: ReactElement -> String
renderToString = runFn1 renderToStringImpl

-- | Render a React element as static markup string without extra DOM attributes.
renderToStaticMarkup :: ReactElement -> String
renderToStaticMarkup = runFn1 renderToStaticMarkupImpl

foreign import renderImpl
  :: EffectFn2
       ReactElement
       Element
       (Nullable ReactComponent)

foreign import hydrateImpl
  :: EffectFn2
       ReactElement
       Element
       (Nullable ReactComponent)

foreign import unmountComponentAtNodeImpl
  :: EffectFn1
       Element
       Boolean

foreign import findDOMNodeImpl
  :: EffectFn1
       ReactComponent
       Element

foreign import renderToStringImpl :: Fn1 ReactElement String

foreign import renderToStaticMarkupImpl :: Fn1 ReactElement String
