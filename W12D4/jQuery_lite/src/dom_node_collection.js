class DOMNodeCollection {
  constructor(nodes) {
    this.nodes = nodes;
  }

  html(string) {
    if (string) {
      this.nodes.forEach(node => {
        node.innerHTML = string;
      });
    } else {
      return nodes[0].innerHTML;
    }
  }

  empty() {
    this.nodes.forEach(node => {
      node.innerHTML = "";
    });
  }

  append(some_thing) {
    if (
      typeof some_thing === "object" &&
      !(some_thing instanceof DOMNodeCollection)
    ) {
      some_thing = new DOMNodeCollection([some_thing]);
    }
    // debugger;
    if (typeof some_thing === "string") {
      this.nodes.forEach(node => {
        node.innerHTML += some_thing;
      });
    } else if (some_thing instanceof DOMNodeCollection) {
      this.nodes.forEach(node => {
        some_thing.nodes.forEach(childNode => {
          node.appendChild(childNode);
        });
      });
    }
  }

  attr(key, val) {
    if (typeof val === "string") {
      this.each(node => node.setAttribute(key, val));
    } else {
      return this.nodes[0].getAttribute(key);
    }
  }

  addClass(newClass) {
    this.each(node => node.classList.add(newClass));
  }

  removeClass(oldClass) {
    this.each(node => node.classList.remove(oldClass));
  }

  toggleClass(toggleClass) {
    this.each(node => node.classList.toggle(toggleClass));
  }

  children() {
    let childNodes = [];
    this.each((node) => {
      const childNodeList = node.children;
      childNodes = childNodes.concat(Array.from(childNodeList));
    });
    return new DomNodeCollection(childNodes);
  }
}

module.exports = DOMNodeCollection;