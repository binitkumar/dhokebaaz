// INSPINIA Landing Page Custom scripts
ready = function () {

    // Highlight the top nav as scrolling
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 80
    })

    // Page scrolling feature
    $('a.page-scroll').bind('click', function(event) {
        var link = $(this);
        $('html, body').stop().animate({
            scrollTop: $(link.attr('href')).offset().top - 70
        }, 500);
        event.preventDefault();
    });

    $(".ckeditor").ckeditor();
    $(".submit-on-enter").keypress(function (e) {
      if (e.which == 13) {
        $(this).parent().submit();
      }
    });

};

$(document).ready(ready);
$(document).on('page:load', ready);
// Activate WOW.js plugin for animation on scrol
new WOW().init();
