import React from 'react';
import ReactDOM from 'react-dom';
import fetchAllPokemon from './util/api_util';
import selectAllPokemon from './reducers/selectors';
import {configureStore} from "./store/store";
import Root from "./components/root";

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.getState = store.getState; 
  window.dispatch = store.dispatch;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);

}); 

