import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions'

export const fetchAllPokemon = () => {
   return (
      $.ajax({
         method: 'GET',
         url: '/api/pokemon',
         success: RECEIVE_ALL_POKEMON
      })
   )
};



window.fetchAllPokemon = fetchAllPokemon