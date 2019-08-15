const FollowToggle = require("./follow_toggle.js");

$(() => {
  $("button.follow-toggle").each(function(i, butt) {
      
     const newTog = new FollowToggle(butt);
     
  })


});