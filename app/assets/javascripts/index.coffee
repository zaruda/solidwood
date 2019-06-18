# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $("img").lazyload();

  header = $('header')
  $('.navbar-burger').click ->
    $(this).toggleClass 'is-active'
    $('.sidebar').toggleClass 'hidden'
    return


  $('.button-modal').click ->
    target = $(this).data('target')
    $(".modal##{target}").addClass 'is-active'
    $('html').addClass 'is-clipped'
    return

  $('.modal-close').click ->
    $(this).closest('.modal').removeClass 'is-active'
    $('html').removeClass 'is-clipped'
    return

  $("form#contact").on("ajax:success", (e, data, status, xhr) ->
    $(".modal#callback").removeClass 'is-active'
    $(this).trigger('reset');
    $(".modal#success").addClass 'is-active'
  ).on "ajax:error", (e, xhr, status, error) ->
    $(".modal#success .box").html("<h1>Произошла ошибка.</h1> <p>Пожалуйста, попробуйте отправить заявку позже!</p>").addClass 'is-active'

  $(window).scroll ->
    scroll = $(window).scrollTop()
    if scroll >= 70 && !header.hasClass 'withBg'
      header.addClass 'white'
    else
      header.removeClass 'white'
    return
  return

