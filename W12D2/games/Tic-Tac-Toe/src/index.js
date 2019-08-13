const View = require("./ttt-view.js"); // require appropriate file
const Game = require("./game.js"); // require appropriate file

$(() => {
  const game = new Game()
  const a = new View(game, $(".ttt"))

  $("ul.group").on("mouseenter mouseleave ", "li", (e) => {
    const $li = $(e.currentTarget);
    $li.toggleClass("hover");
  })

  // $("ul.group").on("click ", "li", (e) => {
  //   const $li = $(e.currentTarget);
  //   game.bindEvents($li.data(pos));
  // })
});

