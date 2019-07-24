import { RECEIVE_BLEATS } from '../actions/bleat_actions';

const bleatsReducer = (state = {}, action) => {
  Object.freeze(state);
  // debugger;
  switch (action.type) {
    // case ADD_BLEAT:
    //   const newBleat = action.bleat;
    //   return Object.assign({}, state, {
    //     [newBleat.id]: newBleat
    //   });
      // state[newBleat.id] = newBleat; don't modify old state!!!
    case RECEIVE_BLEATS:
      const newBleats = {};
      action.bleats.forEach(bleat => newBleats[bleat.id] = bleat);
      return Object.assign({}, state, newBleats);
    default:
      return state;
  }
};

export default bleatsReducer;