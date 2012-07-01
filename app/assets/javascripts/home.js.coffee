#= require libs/jquery.flexslider-min
#= require libs/jquery.easing

$ ->
  $('#hero').flexslider
    animation: "slide"
    easing: "easeInOutCirc"
    useCSS: false
    controlNav: false
    directionNav: false
        
  $('#companies').flexslider
    animation: "slide"
    easing: "easeInOutCirc"
    useCSS: false
    slideshow: false
    directionNav: false
    controlNav: true
    controlsContainer: ".flex-direction-nav"
    manualControls: ".flex-direction-nav li"
  