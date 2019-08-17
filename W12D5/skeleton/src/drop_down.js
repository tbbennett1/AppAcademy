
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  const doggos = [];
  Object.keys(dogs).forEach((dog) => {
    let aTag = document.createElement("a");
    let wrapper = document.createElement("li");
    aTag.innerHTML = dog;
    aTag.href = dogs[dog];
    wrapper.classList = "dog-link";

    wrapper.appendChild(aTag);
    doggos.push(wrapper);
  })
  return doggos
}

function attachDogLinks() {
  let dropdown = document.getElementsByClassName("drop-down-dog-list")[0];
  let doggos = dogLinkCreator();
  doggos.forEach(dog => dropdown.appendChild(dog));
}

function handleEnter() {

  let doggos = Array.from(document.getElementsByClassName("dog-link"));
  doggos.forEach(dog => dog.classList.add("show"));
}

function handleLeave() {
  let doggos = Array.from(document.getElementsByClassName("dog-link"));
  doggos.forEach(dog => dog.classList.remove("show"));
}

// attachDogLinks();

// const nav = document.getElementsByClassName("drop-down-dog-nav")[0];
// nav.addEventListener("mouseenter", handleEnter);
// nav.addEventListener("mouseleave", handleLeave);