const ul = document.getElementsByTagName("ul")[0];

function addTodo(event) {
    event.preventDefault();
    let todosArr = [];
    let inp = document.getElementsByClassName("add-todo")[0];
    const todoObj = {
      done: false,
      inpEl: inp.value
    };
    todosArr.push(todoObj);
    inp = "";

    populateList(todosArr);
}

function populateList(todos) {
  todos.forEach((todo) => {
    let labelTag = document.createElement("label");
    let checkbox = document.createElement("input");
    checkbox.setAttribute("type", "checkbox");
    let liTag = document.createElement("li");
    labelTag.innerText = todo.inpEl;
    liTag.appendChild(labelTag);
    liTag.appendChild(checkbox);
    ul.appendChild(liTag);
  })
}

const form = document.getElementsByClassName("add-todo-form")[0];
form.addEventListener("submit", addTodo);
// populateList();