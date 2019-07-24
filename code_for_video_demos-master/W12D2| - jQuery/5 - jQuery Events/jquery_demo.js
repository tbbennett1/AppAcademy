// document.addEventListener("DOMContentLoaded", function () {
// $(document).on("ready", function () {
$(function () {

  $("li").on("click", function (e) {
    const $li = $(e.currentTarget);
    $li.toggleClass("complete");
  });

});