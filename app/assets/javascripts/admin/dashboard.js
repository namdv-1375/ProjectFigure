$(document).ready(function() {
  fix_height()
});

function fix_height() {
  var navbarHeigh = $('navbar-vertical').height();
  var wrapperHeigh = $('#page-wrapper').height();

  if (navbarHeigh > wrapperHeigh) {
      $('#page-wrapper').css("min-height", navbarHeigh + "px");
  }

  if (navbarHeigh < wrapperHeigh) {
      $('#page-wrapper').css("min-height", $(window).height() + "px");
  }
}