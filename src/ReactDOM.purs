module ReactDOM
  ( render
  , unmountComponentAtNode
  , findDOMNode
  , renderToString
  , renderToStaticMarkup
  ) where

import Control.Monad.Eff (Eff)
import DOM (DOM)
import DOM.Node.Types (Element)
import Data.Function.Eff (runEffFn1, EffFn4, EffFn1, runEffFn4)
import Data.Function.Uncurried (runFn1, Fn1)
import Data.Maybe (Maybe(..))
import React (ReactElement, ReactComponent)

-- | Render a React element in a document element. Returns Nothing for stateless components.
render :: forall eff.
  ReactElement -> Element -> Eff (dom :: DOM | eff) (Maybe ReactComponent)
render = runEffFn4 renderImpl Nothing Just

-- | Removes a mounted React element in a document element.
-- | Returns true if it was unmounted, false otherwise.
unmountComponentAtNode :: forall eff. Element -> Eff (dom :: DOM | eff) Boolean
unmountComponentAtNode = runEffFn1 unmountComponentAtNodeImpl

-- | Finds the DOM node rendered by the component.
findDOMNode :: forall eff. ReactComponent -> Eff (dom :: DOM | eff) Element
findDOMNode = runEffFn1 findDOMNodeImpl

-- | Render a React element as a string.
renderToString :: ReactElement -> String
renderToString = runFn1 renderToStringImpl

-- | Render a React element as static markup string without extra DOM attributes.
renderToStaticMarkup :: ReactElement -> String
renderToStaticMarkup = runFn1 renderToStaticMarkupImpl

foreign import renderImpl :: forall eff.
  EffFn4
    (dom :: DOM | eff)
    (Maybe ReactComponent)
    (ReactComponent -> Maybe ReactComponent)
    ReactElement
    Element
    (Maybe ReactComponent)

foreign import unmountComponentAtNodeImpl :: forall eff.
  EffFn1
    (dom :: DOM | eff)
    Element
    Boolean

foreign import findDOMNodeImpl :: forall eff.
  EffFn1
    (dom :: DOM | eff)
    ReactComponent
    Element

foreign import renderToStringImpl :: Fn1 ReactElement String

foreign import renderToStaticMarkupImpl :: Fn1 ReactElement String
