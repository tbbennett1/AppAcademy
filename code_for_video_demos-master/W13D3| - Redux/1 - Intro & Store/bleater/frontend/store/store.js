import { createStore } from 'redux';
import merge from 'lodash/merge';
window.merge = merge;
const rootReducer = (state = {}, action) => {

  if (action.type === "ADD_BLEAT") {
    const newBleat = action.bleat;
    state.bleats = state.bleats || {};
    const newBleats = Object.assign({}, state.bleats, {
      [newBleat.id]: newBleat
    });
    // state.bleats = newBleats; // don't modify old state....
    state = Object.assign({}, state, {bleats: newBleats});
    // state.bleats[newBleat.id] = newBleat; don't modify old state!!!
  }

  return state;
};

const store = createStore(rootReducer);
export default store;

// store.dispatch({
//   type: "ADD_BLEAT", 
//   bleat: {id: 4, body: "idk", author_id: 1}
// });
// store.getState();


// {
// bleats: 
//   {
//     1: {id: 1, body: "something", author_id: 1},
//     3: {id: 3, body: "something else", author_id: 1}
//   }

//   {1: {id: 1, body: "something", author_id: 1, other_key: "hi"}}
// }