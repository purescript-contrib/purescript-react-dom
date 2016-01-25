/* global exports */
"use strict";

// module ReactDOM

var ReactDOM = require('react-dom');

var ReactDOMServer = require('react-dom/server');

function renderFn(nothing, just, element, container) {
  return function(){
    var result = ReactDOM.render(element, container);
    return result === null ? nothing : just(result);
  }
}
exports.renderFn = renderFn;

function unmountComponentAtNode(container) {
  return function(){
    return ReactDOM.unmountComponentAtNode(container);
  };
}
exports.unmountComponentAtNode = unmountComponentAtNode;

function findDOMNode(component) {
  return function(){
    return ReactDOM.findDOMNode(component);
  };
}
exports.findDOMNode = findDOMNode;

exports.renderToString = ReactDOMServer.renderToString;

exports.renderToStaticMarkup = ReactDOMServer.renderToStaticMarkup;
