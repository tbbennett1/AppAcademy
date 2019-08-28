import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
   // debugger // make sure Object.assign is right
  Object.freeze(state);
   switch (action.type) {
      case RECEIVE_ALL_POKEMON:
         return Object.assign({}, state, action.pokemon)   
      default:
         return state
   }
};


export default pokemonReducer