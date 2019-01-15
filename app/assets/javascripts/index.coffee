# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  header = $('header')
  $('.button-modal').click ->
    target = $(this).data('target')
    $(".modal##{target}").addClass 'is-active'

  $('.modal-close').click ->
    $(this).parent().removeClass 'is-active'

  $(window).scroll ->
    scroll = $(window).scrollTop()
    if scroll >= 100 && !header.hasClass 'withBg'
      header.addClass 'white'
    else
      header.removeClass 'white'
    return
  return

