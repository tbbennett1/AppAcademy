module.exports = {
  fetchBleats() {
    return $.ajax({
      method: "GET",
      url: "/api/bleats"
    });
  },

  createBleat(body) {
    return $.ajax({
      method: "POST",
      url: "/api/bleats",
      data: {bleat: {body: body, author_id: 1}},
    });
  }
};
// module.exports = {
//   fetchBleats: fetchBleats,
//   createBleat: createBleat
// };