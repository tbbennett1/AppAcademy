export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
}
window.selectAllPokemon = selectAllPokemon
