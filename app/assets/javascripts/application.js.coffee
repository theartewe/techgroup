#= require jquery
#= require jquery_ujs
#= require libs/jquery.retina
#= require libs/jquery.fancybox
#= require libs/jquery.easing
#= require libs/jquery.fancybox-media
#= require libs/equalize
#= require libs/selectivizr-min
#= require modernizr.min
#= require respond.min
#= require_self

if navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)
  viewportmeta = document.querySelector('meta[name="viewport"]')
  if viewportmeta
    viewportmeta.content = 'width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0';
    document.body.addEventListener('gesturestart', ( -> viewportmeta.content = 'width=device-width, minimum-scale=0.25, maximum-scale=1.6' ), false)

$ ->
  $('.fancybox-media').fancybox 
  	openEffect  : 'none'
  	closeEffect : 'none'
  	helpers : {
  		media : {}
  	}
  $('img.retina').retina()
  
  $('#mobile-nav > .nav-button').click (event) =>
    event.stopPropagation()
    event.preventDefault()
    if $('#mobile-nav').hasClass('open')
      #close
      $('#mobile-nav').animate  
        'right': -300
        'easing': 'easeOutBack'
      $('#mobile-nav').removeClass('open')
    else
      #open up
      $('#mobile-nav').animate  
        'right': 0
        'easing': 'easeInBack'
      $('#mobile-nav').addClass('open')