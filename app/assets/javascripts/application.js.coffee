#= require jquery
#= require jquery_ujs
#= require libs/jquery.retina
#= require libs/jquery.flexslider-min
#= require libs/equalize
#= require libs/selectivizr-min
#= require_self

if navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)
  viewportmeta = document.querySelector('meta[name="viewport"]')
  if viewportmeta
    viewportmeta.content = 'width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0';
    document.body.addEventListener('gesturestart', ( -> viewportmeta.content = 'width=device-width, minimum-scale=0.25, maximum-scale=1.6' ), false)

is_home = ->
    $('section.home').length > 0

$ ->
  $(window).load ->
    if is_home()
      $('#carousel').flexslider
        controlNav: false
    $('.slider').flexslider()

  if is_home()
    $(window).bind "load resize", ->
      $(".equal").removeAttr("style")
      $(".equal, .slides > li, .flex-direction-nav, .banner").equalHeight()
      $("nav.services ul li a").removeAttr("style")
      $("nav.services ul li a").equalHeight()

    $('img.retina').retina()

  $('#contact_form').submit ->
    event.stopPropagation()
    event.preventDefault()

    url     = $(this).attr('action')
    params  = $(this).serializeArray()

    $.post url, params, (data) ->
      if data == "okay"
        $('.thank-you').show()
