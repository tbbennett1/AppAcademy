/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\n\nclass Clock {\n    constructor() {\n      // 1. Create a Date object.\n      const currentTime = new Date();\n  \n      // 2. Store the hour, minute, and second.\n      this.hours = currentTime.getHours();\n      this.minutes = currentTime.getMinutes();\n      this.seconds = currentTime.getSeconds();\n  \n      // 3. Call printTime.\n      Object(_warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"])(this.printTime(), clockElement);\n  \n      // 4. Schedule the tick at 1 second intervals.\n      setInterval(this._tick.bind(this), 1000);\n    }\n  \n    printTime() {\n      // Format the time in HH:MM:SS\n      const timeString = [this.hours, this.minutes, this.seconds].join(\":\");\n\n      return timeString;\n\n    }\n  \n    _tick() {\n      // 1. Increment the time by one second.\n      this._incrementSeconds();\n  \n      // 2. Call printTime.\n      Object(_warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"])(this.printTime(), clockElement);\n    }\n  \n    _incrementSeconds() {\n      // 1. Increment the time by one second.\n      this.seconds += 1;\n      if (this.seconds === 60) {\n        this.seconds = 0;\n        this._incrementMinutes();\n      }\n    }\n  \n    _incrementMinutes() {\n      this.minutes += 1;\n      if (this.minutes === 60) {\n        this.minutes = 0;\n        this._incrementHours();\n      }\n    }\n  \n    _incrementHours() {\n      this.hours = (this.hours + 1) % 24;\n    }\n  }\n  \n// const clockElement = document.getElementById('clock');\n// const clock = new Clock();\n  \n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nfunction dogLinkCreator() {\n  const doggos = [];\n  Object.keys(dogs).forEach((dog) => {\n    let aTag = document.createElement(\"a\");\n    let wrapper = document.createElement(\"li\");\n    aTag.innerHTML = dog;\n    aTag.href = dogs[dog];\n    wrapper.classList = \"dog-link\";\n\n    wrapper.appendChild(aTag);\n    doggos.push(wrapper);\n  })\n  return doggos\n}\n\nfunction attachDogLinks() {\n  let dropdown = document.getElementsByClassName(\"drop-down-dog-list\")[0];\n  let doggos = dogLinkCreator();\n  doggos.forEach(dog => dropdown.appendChild(dog));\n}\n\nfunction handleEnter() {\n\n  let doggos = Array.from(document.getElementsByClassName(\"dog-link\"));\n  doggos.forEach(dog => dog.classList.add(\"show\"));\n}\n\nfunction handleLeave() {\n  let doggos = Array.from(document.getElementsByClassName(\"dog-link\"));\n  doggos.forEach(dog => dog.classList.remove(\"show\"));\n}\n\n// attachDogLinks();\n\n// const nav = document.getElementsByClassName(\"drop-down-dog-nav\")[0];\n// nav.addEventListener(\"mouseenter\", handleEnter);\n// nav.addEventListener(\"mouseleave\", handleLeave);\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_drop_down__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_todo_list__WEBPACK_IMPORTED_MODULE_3__);\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const ul = document.getElementsByTagName(\"ul\")[0];\n\nfunction addTodo(event) {\n    event.preventDefault();\n    let todosArr = [];\n    let inp = document.getElementsByClassName(\"add-todo\")[0];\n    const todoObj = {\n      done: false,\n      inpEl: inp.value\n    };\n    todosArr.push(todoObj);\n    inp = \"\";\n\n    populateList(todosArr);\n}\n\nfunction populateList(todos) {\n  todos.forEach((todo) => {\n    let labelTag = document.createElement(\"label\");\n    let checkbox = document.createElement(\"input\");\n    checkbox.setAttribute(\"type\", \"checkbox\");\n    let liTag = document.createElement(\"li\");\n    labelTag.innerText = todo.inpEl;\n    liTag.appendChild(labelTag);\n    liTag.appendChild(checkbox);\n    ul.appendChild(liTag);\n  })\n}\n\nconst form = document.getElementsByClassName(\"add-todo-form\")[0];\nform.addEventListener(\"submit\", addTodo);\n// populateList();\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n  if (htmlElement.children) {\n    Array.from(htmlElement.children).forEach((child) => htmlElement.removeChild(child));\n  }\n  \n  let p = document.createElement(\"p\");\n  // let text = document.createTextNode(string);\n  // p.appendChild(text);\n  p.innerHTML = string;\n  htmlElement.appendChild(p);\n};\n\n// htmlGenerator('Party Time.', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });