import ApiUtil from '../util/apiUtil';

// export const ADD_BLEAT = "ADD_BLEAT";
export const RECEIVE_BLEATS = "RECEIVE_BLEATS";

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

export const receiveBleats = (bleats) => {
  return {
    type: RECEIVE_BLEATS,
    bleats
  };
};
 
export const fetchBleats = () => {
  return (dispatch) => {
    return ApiUtil.fetchBleats().then(bleats => {
      dispatch(receiveBleats(bleats)) 
    });
  };
};


// store.dispatch(fetchBleats);

// window.addBleat = addBleat;
window.fetchBleats = fetchBleats;
