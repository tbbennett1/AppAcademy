import React from 'react'

class TodoForm extends React.Component {
  
    render () {
      return (
           <form onSubmit={this.props.receiveTodo}> 
               Title:
              <input type='text' name="Todo Title"  ></input>
              Body:
              <input type='textarea' name="Todo Body"  ></input>
              <input type='submit' value="submit"></input>
            </form>         
      );
    }
  }

export default TodoForm;