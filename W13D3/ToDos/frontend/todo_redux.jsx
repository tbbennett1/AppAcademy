import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'


function Root() {

    return (
        <div>
            <h1>Todos App</h1>
        </div>
    )
}

document.addEventListener('DOMContentLoaded' ,() => {
    const root = document.getElementById('root');
    ReactDOM.render(<Root />, root)
});
const store = configureStore;
window.store = store