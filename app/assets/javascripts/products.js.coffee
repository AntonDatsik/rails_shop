# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#search-input').keyup ->
    keyword = $(this).val()
    if keyword.length > 0
      $('#search-hidden-button').click()
    else
      $.get 'products', keywords: null
    return
  return

$(document).ready(ready)
$(document).on('page:load', ready)
