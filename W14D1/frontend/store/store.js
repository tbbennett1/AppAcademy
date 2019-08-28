import {createStore, applyMiddleware} from 'redux'
import rootReducer from '../reducers/root_reducer'
import logger from 'redux-logger'
import thunk from '../middleware/thunk';
import * as APIUtil from "../util/api_util"

export const configureStore = () => (
   createStore(
      rootReducer, 
      applyMiddleware(thunk, logger)
      )
);


export const requestAllPokemon = () => (dispatch) => (
   APIUtil.fetchAllPokemon()
   .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
 )

 window.requestAllPokemon = requestAllPokemon
