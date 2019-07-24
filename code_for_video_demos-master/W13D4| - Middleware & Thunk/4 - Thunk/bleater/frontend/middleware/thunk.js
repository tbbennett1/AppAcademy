const thunk = store => next => action => {
  debugger;
  if (typeof action === "function") {
    return action(store.dispatch);
  } else {
    return next(action);
  }
};

// (dispatch) => {
//   ApiUtil.fetchBleats().then(bleats => {
//     dispatch(receiveBleats(bleats)) 
//   });
// };

// store.dispatch({
//   type: "ADD_BLEAT",
//   bleat: {}
// });

// const promise = store.dispatch(() => {
//   return $.ajax({
//     url: '/api/bleats',
//     method: 'GET'
//   })
// });

// promise.then()



export default thunk;