export const ADD_BLEAT = "ADD_BLEAT";

let nextId = 0;
export const addBleat = (body) => {
  nextId++;
  return {
    type: ADD_BLEAT, 
    bleat: {id: nextId, body: body, author_id: 1}
  };
};

window.addBleat = addBleat;

