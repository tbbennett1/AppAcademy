import React from 'react'

const allTodos = function(state) {
    return Object.keys(state.todos).map(id => state.todos[id])
}

export default allTodos;
window.allTodos = allTodos;