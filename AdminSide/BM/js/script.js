// Show/Hide Password

$(".toggle-password").click(function() {

  $(this).toggleClass("fa-eye fa-eye-slash");
  var input = $($(this).attr("toggle"));
  if (input.attr("type") == "password") {
    input.attr("type", "text");
  } else {
    input.attr("type", "password");
  }
});


//Transparent Navigation

/*
$(function () {

    //show/hide nav on page load
    showHideNav();

    $(window).scroll(function () {

        //show/hide nav on windows Scroll
        showHideNav();
    });

    function showHideNav() {
        if ($(window).scrollTop() > 50) {
            
            $("nav").removeClass("transparent-nav");
            // show white nav
            $("nav").addClass("white-nav-top");
            // show dark logo
            $(".navbar-brand img").attr("src", "images/logo/logo.png");

            //show back to top button
            $("#back-to-top").fadeIn();

        } else {
            
            $("nav").addClass("transparent-nav");
            // hide white nav
            $("nav").removeClass("white-nav-top");

            //normal logo

            $(".navbar-brand img").attr("src", "images/logo/top-logo.png");

            //hide back to top button
            $("#back-to-top").fadeOut();
        }
    }
});*/



// FAQ Accordion

var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
