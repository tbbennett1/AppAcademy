import React from 'react'
import ToDoContainer from './todo/todo_list_container'

class App extends React.Component{
    render () {
        return (
            <div>
                <h1>ToDo List</h1>
                <ToDoContainer />
            </div>
        )
    }
}

export default App;