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

    var checked = $(this).is(":checked");

    if (checked == true) {
      $(".user-details").hide(); 
    } else {
      $(".user-details").show(); 
    }

    $("#post-as-anonymous-checkbox").on("click", function(){
      var checked = $(this).is(":checked");

      if (checked == true) {
        $(".user-details").hide(); 
      } else {
        $(".user-details").show(); 
      }
    })

    $('.chosen-select').chosen({allow_single_deselect: true, 
      no_results_text: 'No results matched', width: '200px' })
};

$(document).ready(ready);
$(document).on('page:load', ready);
// Activate WOW.js plugin for animation on scrol
new WOW().init();
