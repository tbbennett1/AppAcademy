import React from 'react'
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form'
import {receiveTodo} from '../../actions/todo_actions'

class TodoList extends React.Component {
    render (){
        return(
        <div>
            <ul>
                {this.props.todos.map((todo, idx )=> (
                    <TodoListItem todo={todo} key={idx} />
                    ))}
            </ul>

            <TodoForm receiveTodo={receiveTodo}/>
        </div>
        )
    }
}

export default TodoList;