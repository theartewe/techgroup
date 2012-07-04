#= require libs/jquery.flexslider-min

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
    itemWidth: 220
    itemMargin: 5
    animationLoop: false
    minItems: 1
    maxItems: 5
    controlsContainer: ".flex-direction-nav"
    manualControls: ".flex-direction-nav li"

  