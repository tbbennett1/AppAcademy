import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'
import App from './components/app'
import {Provider} from 'react-redux'
import allTodos from './reducers/selectors'


const Root = ({ store }) => (
    <Provider store={ store }>
      <App />
    </Provider>
  );

export default Root;

document.addEventListener('DOMContentLoaded' ,() => {
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root)
});

window.allTodos = allTodos;
const store = configureStore;
window.store = store;