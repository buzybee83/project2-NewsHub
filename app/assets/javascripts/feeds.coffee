# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).ready ->
#  $('.grid').masonry
#    itemSelector: '.grid-item'
#    columnWidth: 2
#  return

$(document).ready ->
  setInterval (->
    $('.grid').masonry
      itemSelector: '.grid-item'
      columnWidth: 2
    return
  ), 3000
return
