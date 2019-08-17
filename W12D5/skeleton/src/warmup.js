
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  if (htmlElement.children) {
    Array.from(htmlElement.children).forEach((child) => htmlElement.removeChild(child));
  }
  
  let p = document.createElement("p");
  // let text = document.createTextNode(string);
  // p.appendChild(text);
  p.innerHTML = string;
  htmlElement.appendChild(p);
};

// htmlGenerator('Party Time.', partyHeader);