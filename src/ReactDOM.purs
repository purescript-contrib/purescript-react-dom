module ReactDOM
  ( render
  , unmountComponentAtNode
  , findDOMNode
  , renderToString
  , renderToStaticMarkup
  ) where

import Effect (Effect)
import Effect.Uncurried (runEffectFn1, EffectFn4, EffectFn1, runEffectFn4)
import Data.Function.Uncurried (runFn1, Fn1)
import Data.Maybe (Maybe(..))
import React (ReactElement, ReactComponent)
import Web.DOM.Element (Element)

-- | Render a React element in a document element. Returns Nothing for stateless components.
render
  :: ReactElement
  -> Element
  -> Effect (Maybe ReactComponent)
render = runEffectFn4 renderImpl Nothing Just

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
  :: EffectFn4
       (Maybe ReactComponent)
       (ReactComponent -> Maybe ReactComponent)
       ReactElement
       Element
       (Maybe ReactComponent)

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
