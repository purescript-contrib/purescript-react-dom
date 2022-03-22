import ReactDOM from "react-dom";
import ReactDOMServer from "react-dom/server";

export function renderImpl(element, container) {
  return ReactDOM.render(element, container);
}

export function hydrateImpl(element, container) {
  return ReactDOM.hydrate(element, container);
}

export const unmountComponentAtNodeImpl = ReactDOM.unmountComponentAtNode;
export const findDOMNodeImpl = ReactDOM.findDOMNode;
export const renderToStringImpl = ReactDOMServer.renderToString;
export const renderToStaticMarkupImpl = ReactDOMServer.renderToStaticMarkup;
