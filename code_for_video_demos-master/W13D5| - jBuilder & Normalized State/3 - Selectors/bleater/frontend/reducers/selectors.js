export const bleatsAndAuthors = (state) => {
  const bleats = Object.values(state.bleats);
  bleats.forEach((bleat, i) => {
    bleat = Object.assign({}, bleat);
    bleats[i] = bleat;
    bleat.author = state.users[bleat.author_id]
  });

  return bleats;
};