import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

const store = createStore(rootReducer);
export default store;

// store.dispatch({
//   type: "ADD_BLEAT", 
//   bleat: {id: 4, body: "idk", author_id: 1}
// });
// store.getState();


// {
//   bleats: {
//     1: {id: 1, body: "something", author_id: 1},
//     3: {id: 3, body: "something else", author_id: 1}
//   },
//   locations: {
//     1: {id: 1, name: "Argentina"},
//     2: {id: 2, name: "NYC"}
//   }
//  
// }