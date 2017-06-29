// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).foundation();

$(function() {
  $('.button-like')
    .bind('click', function(event) {
      $(".button-like").toggleClass("liked");
    })
});

let upvoteFunction = () => {
  $(".upvote").click( function(event) {
    event.preventDefault();

    var divUp = $(this).find("#up");
    divUp.toggleClass('on');
    return false;
}

let downvoteFunction = () => {
  $('.downvote').on("click", function(event) {
    event.preventDefault();

    var divDown = $(this).find("#down");
    divDown.toggleClass('on');
    return false;
}

$(document).ready(function() {
  // $(".upvote").click( function(event) {
  //   event.preventDefault();
  //
  //   var divUp = $(this).find("#up");
  //   divUp.toggleClass('on');
  //   return false;

  upvoteFunction();
  downvoteFunction();

    $.ajax({
    url : "/api/v1/reviews",
    type: "GET",
    success: function(data, textStatus, jqXHR) {
        // change UI here.

    },
    error: function (jqXHR, textStatus, errorThrown) {
    }
});
  });

  // $('.downvote').on("click", function(event) {
  //   event.preventDefault();
  //
  //   var divDown = $(this).find("#down");
  //   divDown.toggleClass('on');
  //   return false;
  // });
})
