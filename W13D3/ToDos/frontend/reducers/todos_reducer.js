import {RECEIVE_TODO} from '../actions/todo_actions'
import {RECEIVE_TODOS} from '../actions/todo_actions'

const initialState = {
    1: {
      id: 1,
      title: 'wash car',
      body: 'with soap',
      done: false
    },
    2: {
      id: 2,
      title: 'wash dog',
      body: 'with shampoo',
      done: true
    },
  };
  
const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    switch(action.type) {
        case RECEIVE_TODOS:
            let newTodos = action.todos
            let newState = {};
            newTodos.forEach(todo => {
                newState[todo.id] = todo
            })
        case RECEIVE_TODO:
            let newToDo = action.todo;
            state = state || {};
            return Object.assign({}, state, {
              [newToDo.id]: newToDo
            });
        default:
            return state;
    }
  };

  window.todosReducer = todosReducer;
  
  export default todosReducer;