$(function () {

  const $bleatsUl = $("ul#bleats");

  $.ajax({
    method: "GET",
    url: "/api/bleats",
    success: function (bleats) {
      const $lis = bleats.map(bleat => {
        return $("<li>").html(
          $("<a>")
            .attr("href", `/bleats/${ bleat.id }`)
            .text(bleat.body)
        )
      });
      $bleatsUl.append($lis);
    },
    error: function () {
      console.log("error!");
    }

  });

});