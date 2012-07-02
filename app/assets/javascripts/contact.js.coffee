#= require_self

$ ->
  $('#contact_form').submit ->
    event.stopPropagation()
    event.preventDefault()

    url     = $(this).attr('action')
    params  = $(this).serializeArray()
  
    $.post url, params, (data) ->
      if data == "okay"
        $('.thank-you').show()
        $('#contact_form').hide()
        $('.form > h4').hide()