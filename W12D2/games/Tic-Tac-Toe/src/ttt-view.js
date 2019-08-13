class View {
  constructor(game, $el) {
    this.game = game;
    this.grid = game.board.grid;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
      this.$el.on("click", "li", (e => {
        const $square = $(e.currentTarget);
        this.makeMove($square);
      }))
  }

  makeMove($square) {
    const mark = this.game.currentPlayer
    try {
      this.game.playMove($square.data("pos"));
    } catch (error) {
      alert(error.msg);
      return;
    };
    if (mark === "x"){

      $square.addClass("x");

    }
    else{

      $square.addClass("o");
    };
    if (this.game.isOver()) {
      alert(`the winner is ${this.game.winner()}`);
    };
  }

  setupBoard() {
    const $ul = $("<ul>");
    $ul.addClass("group");
    
    for (let i = 0;i < 3;i ++){
      for (let j = 0; j < 3; j++) {
        let $li = $("<li>");
        $li.data("pos",[i,j]);
        $ul.append($li);
      }
    };
    this.$el.append($ul);
    // this.$el.append("<ul  ></ul>");
    // this.grid.forEach(element1 => {
    //     this.grid.forEach(element2 => {

    //     })
    // });
  }
}

module.exports = View;