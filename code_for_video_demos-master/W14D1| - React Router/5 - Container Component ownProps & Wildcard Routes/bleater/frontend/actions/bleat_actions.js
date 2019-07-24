import ApiUtil from '../util/apiUtil';

// export const ADD_BLEAT = "ADD_BLEAT";
export const RECEIVE_BLEATS_AND_AUTHORS = "RECEIVE_BLEATS_AND_AUTHORS";

// let nextId = 0;
// export const addBleat = (body) => {
//   nextId++;
//   return {
//     type: ADD_BLEAT, 
//     bleat: {id: nextId, body: body, author_id: 1}
//   };
// };

export const createBleat = (body) => {
  return (dispatch) => {
    ApiUtil.createBleat(body).then(bleat => {
      dispatch(receiveBleats([bleat]));
    });
  };
};

export const receiveBleats = (payload) => {
  return {
    type: RECEIVE_BLEATS_AND_AUTHORS,
    payload
    // bleat: payload.bleats,
    // users: payload.users
  };
};
 
export const fetchBleats = () => {
  return (dispatch) => {
    return ApiUtil.fetchBleats().then(response => {
      // debugger;
      dispatch(receiveBleats(response)) 
    });
  };
};

export const fetchBleat = (id) => {
  return (dispatch) => {
    return ApiUtil.fetchBleat(id).then(response => {
      dispatch(receiveBleats(response));
    })
  }
}


// store.dispatch(fetchBleats);

// window.addBleat = addBleat;
window.fetchBleats = fetchBleats;
