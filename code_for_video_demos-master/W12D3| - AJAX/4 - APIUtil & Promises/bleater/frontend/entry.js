const apiUtil = require("./util/apiUtil.js");

$(function () {

  const $bleatsUl = $("ul#bleats");

  const renderBleat = function (bleat) {
    return $("<li>").html(
      $("<a>")
        .attr("href", `/bleats/${ bleat.id }`)
        .text(bleat.body)
    );
  };  

  const renderBleats = function (bleats) {
    const $lis = bleats.map(renderBleat);
    $bleatsUl.append($lis);
  };

  const errorCb = function () {
    console.log("error!");
  };

  // $.ajax({
  //   method: "GET",
  //   url: "/api/bleats",
  //   success: renderBleats,
  //   error: errorCb
  // });
  apiUtil.fetchBleats().then(renderBleats, errorCb);

  const $bleatForm = $("#bleat-form");
  const $bleatBody = $bleatForm.find("#bleat-body");
  $bleatForm.on("submit", function (e) {
    e.preventDefault();
    const bodyText = $bleatBody.val();
    $bleatBody.val("");
    // $.ajax({
    //   method: "POST",
    //   url: "/api/bleats",
    //   data: {bleat: {body: bodyText, author_id: 1}},
    //   success: bleat => renderBleats([bleat]),
    //   error: errorCb
    // });
    apiUtil
      .createBleat(bodyText)
      .then(
        bleat => renderBleats([bleat]),
        errorCb
      );

  });

});