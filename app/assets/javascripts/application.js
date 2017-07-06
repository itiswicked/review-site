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

makeUpvoteAjaxRequest = (id) => {
  var upvoteRequest = $.ajax({
    type: "POST",
    url: `/api/v1/reviews/${id}/upvote`,
    data: { review_id: id },
    success: function() {
      var divUp = $("tr").find("#up");
      var divCount = $("tr").find("#vote-count");
      var upVoteTotal = 0;
      divUp.toggleClass("on");
      divDown.removeClass("on");
      if (divUp.hasClass("on")) {
        upVoteTotal += 1
        $(divCount).text(upVoteTotal)
      } else {
          if (upVoteTotal >= 1) {
            upVoteTotal -= 1
            $(divCount).text(upVoteTotal +"votes")
          } else {
            upVoteTotal -= 0
            $(divCount).text(upVoteTotal)
          }
        };
    },
  });
};

makeDownvoteAjaxRequest = (id) => {
  var downvoteRequest = $.ajax({
    type: "POST",
    url: `/api/v1/reviews/${id}/downvote`,
    data: { review_id: id },
    success: function() {
      var divDown = $("tr").find("#down");
      var divUp = $("tr").find("#up");
      divDown.toggleClass("on");
      divUp.removeClass("on");
      if (divDown.hasClass("on")) {
        upVoteTotal += 1
        $(divCount).text(upVoteTotal)
      } else {
          if (upVoteTotal >= 1) {
            upVoteTotal -= 1
            $(divCount).text(upVoteTotal +"votes")
          } else {
            upVoteTotal -= 0
            $(divCount).text(upVoteTotal)
          }
        };
    },
  });
};

$(document).ready(function() {
  $('.upvote').on("click", function(event) {
    event.preventDefault();
    var eventId = parseInt(event.target.dataset.id);
    makeUpvoteAjaxRequest(eventId);
  });

  $('.downvote').on("click", function(event) {
    event.preventDefault();
    var eventId = parseInt(event.target.dataset.id);
    makeDownvoteAjaxRequest(eventId);
  });
});
