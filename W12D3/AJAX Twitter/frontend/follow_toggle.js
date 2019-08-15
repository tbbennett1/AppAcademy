const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(el){
    this.el = $(el);
    this.userId = this.el.data("user-id");
    this.followState = this.el.data("initial-follow-state");
    this.render();

    this.el.on("click", this.handleClick.bind(this));
  }

  render() {
    if (this.followState === "unfollow") {
      this.el.prop("disabled", false);
      this.el.html("follow");
    } else if (this.followState === "follow") {
      this.el.prop("disabled", false);
      this.el.html("unfollow");
    } else if (this.followState === "following") {
      this.el.prop("disabled", true);
      this.el.html("following");
    } else if (this.followState === "unfollowing") {
      this.el.prop("disabled", true);
      this.el.html("unfollowing");
    }
  }

  handleClick(event) {
    event.preventDefault();
    // debugger;
    // this.render();
    // this.followState = this.followState === "unfollow" ? "follow" : "unfollow"; "following"
    if (this.followState === "unfollow") {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId)
        .then(() => {
          this.followState = "follow";
          this.render();   
        })} else {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId)
        .then(() => {
          this.followState = "unfollow";
          this.render();
      });
    }
  }
}

module.exports = FollowToggle;

