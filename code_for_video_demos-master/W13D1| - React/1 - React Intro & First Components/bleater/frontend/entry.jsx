const apiUtil = require("./util/apiUtil.js");
import ReactDOM from 'react-dom';
import React from 'react';
import App from './app';

document.addEventListener("DOMContentLoaded", function () {

  const root = document.getElementById("root");

  // const hello = React.createElement("h1", null, ["Hello, World!"])
  // const article = React.createElement(
  //   "article", 
  //   null, 
  //   [
  //     React.createElement("p", null, ["Hello from the first paragraph"]),
  //     React.createElement("p", null, ["Hello from the second p tag"])
  //   ]
  // );

  // const article = <article>
  //   <p>Hello from the first paragraph</p>
  //   <p>Hello from the second!</p>
  // </article>;
  // const hello = React.createElement(App);
  // const hello = <App />;
  ReactDOM.render(<App />, root);

});
