// document.addEventListener("DOMContentLoaded", function () {
// $(document).on("ready", function () {
$(function () {

  $(".todo-list").on("click", "li", function (e) {
    const $li = $(e.currentTarget);
    $li.toggleClass("complete");
  });

  $(".todo-form").on("submit", function (e) {
    e.preventDefault();
    const $form = $(e.currentTarget);
    const $input = $form.find("#todo-text");
    const text = $input.val();

    $("<li>").text(text).appendTo($(".todo-list"));
    $input.val("");
  });

});