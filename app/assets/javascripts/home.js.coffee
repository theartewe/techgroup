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
    
  $(window).bind "load resize", ->
    #$(".equal").removeAttr("style")
    #$(".equal, .slides > li, .flex-direction-nav, .banner").equalHeight()
    #$("nav.services ul li a").removeAttr("style")
    #$("nav.services ul li a").equalHeight()

  $('img.retina').retina()
  