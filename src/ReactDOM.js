"use strict";

import ReactDOM from "react-dom";
import ReactDOMServer from "react-dom/server";

export function renderImpl(element, container) {
  return ReactDOM.render(element, container);
}

export function hydrateImpl(element, container) {
  return ReactDOM.hydrate(element, container);
}

export var unmountComponentAtNodeImpl = ReactDOM.unmountComponentAtNode;
export var findDOMNodeImpl = ReactDOM.findDOMNode;
export var renderToStringImpl = ReactDOMServer.renderToString;
export var renderToStaticMarkupImpl = ReactDOMServer.renderToStaticMarkup;
