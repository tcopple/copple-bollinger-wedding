$(document).ready( function() {
  $('navigation li').click(function() {

    //we dont' want to take action on links that send the user outside the site
    if($(this).hasClass('terminating')) { return }

    var clicked = $(this).attr('class');
    var content = $("content");
    var original = $("content").children().not('.hide').first();
    var replacement = $('content').children("#"+clicked).first();

    content.slideUp(1500, function() {
      original.addClass('hide');
      replacement.removeClass('hide');
      content.slideDown(1500);
    });
  });
});
