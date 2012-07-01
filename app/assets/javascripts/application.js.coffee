#= require jquery
#= require jquery_ujs
#= require libs/jquery.retina
#= require libs/jquery.fancybox
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