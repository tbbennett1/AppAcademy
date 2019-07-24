import { RECEIVE_BLEATS_AND_AUTHORS } from '../actions/bleat_actions';


const usersReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_BLEATS_AND_AUTHORS:
      return Object.assign({}, state, action.payload.users); 
    default:
      return state;
  }

};

export default usersReducer;