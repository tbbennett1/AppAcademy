const bleatsReducer = (state = {}, action) => {
  // debugger;
  switch (action.type) {
    case "ADD_BLEAT":
      const newBleat = action.bleat;
      return Object.assign({}, state, {
        [newBleat.id]: newBleat
      });
      // state[newBleat.id] = newBleat; don't modify old state!!!
    default:
      return state;
  }
};

export default bleatsReducer;