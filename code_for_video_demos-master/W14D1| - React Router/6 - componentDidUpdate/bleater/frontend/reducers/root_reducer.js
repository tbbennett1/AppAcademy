import merge from 'lodash/merge';
import bleatsReducer from './bleats_reducer';
import { combineReducers } from 'redux';
import usersReducer from './users_reducer';

const rootReducer = (state = {}, action) => {
  // debugger;
  return {
    bleats: bleatsReducer(state.bleats, action),
    users: usersReducer(state.users, action),
    // locations: locationsReducer(state.locations, action)
  };
};

// const rootReducer = combineReducers({
//   bleats: bleatsReducer,
//   // locations: locationsReducer
// });



export default rootReducer;