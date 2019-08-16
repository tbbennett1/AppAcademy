const DOMNodeCollection = require ('./dom_node_collection.js');

window.$l = function (arg) {
  // debugger;
  if (typeof(arg) === 'string') {
    console.log('arg is a string');
    return stringHelperThing(arg);
  } else if (arg instanceof HTMLElement) {
    console.log('arg is an HTML Element');
    return new DOMNodeCollection([arg]);
  } else {
    this.console.log("IDK what I'm looking at.");
  }
} 

function stringHelperThing (arg) {
  const nodesArr = Array.from(document.querySelectorAll(arg));
  return new DOMNodeCollection(nodesArr);
}
/*
const ul = document.getElementsByTagName('ul')[0]
const $ul = $l(ul)
const li = document.createElement('li')
li.innerText = "thing 4"
const $li = $l(li)
$ul.append($li)
*/