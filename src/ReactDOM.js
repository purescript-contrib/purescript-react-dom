/* global exports */
"use strict";

var ReactDOM = require("react-dom");
var ReactDOMServer = require("react-dom/server");

exports.renderImpl = function (nothing, just, element, container) {
  var result = ReactDOM.render(element, container);
  return result === null ? nothing : just(result);
};

exports.unmountComponentAtNodeImpl = ReactDOM.unmountComponentAtNode;
exports.findDOMNodeImpl = ReactDOM.findDOMNode;

exports.renderToStringImpl = ReactDOMServer.renderToString;
exports.renderToStaticMarkupImpl = ReactDOMServer.renderToStaticMarkup;
