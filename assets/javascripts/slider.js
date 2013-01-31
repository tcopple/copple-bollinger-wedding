$(document).ready( function() {
  $('navigation li').click(function() {
    // //we dont' want to take action on links that send the user outside the site
    // if($(this).hasClass('terminating')) { return }

    // var clicked = $(this).attr('class');
    // var original = $("content").children().not('.hide').first();
    // var replacement = $('content').children("#"+clicked).first();

    // original.slideUp(1500, function() {
    //   original.addClass('hide');
    //   replacement.slideDown(1500, function() {
    //     replacement.removeClass('hide');
    //   });
    // });
  });
});
