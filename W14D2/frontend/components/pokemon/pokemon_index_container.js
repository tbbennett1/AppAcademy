import { connect } from 'react-redux';
import {selectAllPokemon} from "../../reducers/selectors"
import PokemonIndex from "./pokemon_index"

const mapStateToProps = state => ({
   pokemon: selectAllPokemon(state)// piece of state that container subscribes to
 });

const mapDispatchToProps = dispatch => ({
   requestAllPokemon: () => dispatch(requestAllPokemon())// dispatch requestAllPokemon action.
 });


 export default connect(
   mapStateToProps,
   mapDispatchToProps
 )(PokemonIndex);