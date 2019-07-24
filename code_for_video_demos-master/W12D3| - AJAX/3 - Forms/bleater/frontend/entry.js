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

  const $bleatForm = $("#bleat-form");
  const $bleatBody = $bleatForm.find("#bleat-body");
  $bleatForm.on("submit", function (e) {
    e.preventDefault();
    const bodyText = $bleatBody.val();
    $bleatBody.val("");
    $.ajax({
      method: "POST",
      url: "/api/bleats",
      data: {bleat: {body: bodyText, author_id: 1}},
      success: function (bleat) {
        $bleatsUl.append(
          $("<li>").html(
            $("<a>")
              .attr("href", `/bleats/${ bleat.id }`)
              .text(bleat.body)
          )
        )
      },
      error: function () {
        debugger;
        console.log("error!");
      }
    })
  });

});