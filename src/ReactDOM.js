/* global exports */
"use strict";

var ReactDOM = require("react-dom");
var ReactDOMServer = require("react-dom/server");

exports.renderImpl = function (element, container) {
  return ReactDOM.render(element, container);
};

exports.hydrateImpl = function (element, container) {
  return ReactDOM.hydrate(element, container);
};

exports.unmountComponentAtNodeImpl = ReactDOM.unmountComponentAtNode;
exports.findDOMNodeImpl = ReactDOM.findDOMNode;

exports.renderToStringImpl = ReactDOMServer.renderToString;
exports.renderToStaticMarkupImpl = ReactDOMServer.renderToStaticMarkup;
