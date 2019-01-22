# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  GoogleAnalytics.trackPageview()
  header = $('header')
  $('.navbar-burger').click ->
    $(this).toggleClass 'is-active'
    $('.sidebar').toggleClass 'hidden'


  $('.button-modal').click ->
    target = $(this).data('target')
    $(".modal##{target}").addClass 'is-active'
    $('html').addClass 'is-clipped'


  $('.modal-close').click ->
    $(this).parent().removeClass 'is-active'
    $('html').removeClass 'is-clipped'


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

