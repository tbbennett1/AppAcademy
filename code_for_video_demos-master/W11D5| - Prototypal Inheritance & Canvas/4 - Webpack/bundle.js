!function(o){var t={};function e(n){if(t[n])return t[n].exports;var r=t[n]={i:n,l:!1,exports:{}};return o[n].call(r.exports,r,r.exports,e),r.l=!0,r.exports}e.m=o,e.c=t,e.d=function(o,t,n){e.o(o,t)||Object.defineProperty(o,t,{enumerable:!0,get:n})},e.r=function(o){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(o,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(o,"__esModule",{value:!0})},e.t=function(o,t){if(1&t&&(o=e(o)),8&t)return o;if(4&t&&"object"==typeof o&&o&&o.__esModule)return o;var n=Object.create(null);if(e.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:o}),2&t&&"string"!=typeof o)for(var r in o)e.d(n,r,function(t){return o[t]}.bind(null,r));return n},e.n=function(o){var t=o&&o.__esModule?function(){return o.default}:function(){return o};return e.d(t,"a",t),t},e.o=function(o,t){return Object.prototype.hasOwnProperty.call(o,t)},e.p="",e(e.s=1)}([function(o,t){function e(o){this.name=o}e.prototype.eat=function(){console.log("nom nom nom")},o.exports=e},function(o,t,e){const n=e(2),r=new(e(3))("Lola","sqweaky frog");new n("Charlie");window.lola=r},function(o,t,e){const n=e(0);function r(o){n.call(this,o)}function u(){}u.prototype=n.prototype,r.prototype=new u,r.prototype.constructor=r,r.prototype.meow=function(){console.log("meow")},o.exports=r},function(o,t,e){const n=e(0);function r(o,t){n.call(this,o),this.favoriteToy=t}function u(){}u.prototype=n.prototype,r.prototype=new u,r.prototype.constructor=r,r.prototype.bark=function(){console.log("woof woof")},o.exports=r}]);