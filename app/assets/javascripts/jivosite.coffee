# Chat online jivo

runChat = ->
  $('#jivo-iframe-container, .jivo_shadow, [src*="//code.jivosite"]').remove()
  delete window.jivo_api
  delete window.jivo_config
  window.jivo_magic_var = undefined
  window.$jivosite = null
  ((d, s) ->
    z =
      $jivosite = (c) ->
        z._.push c
        return

    el_script = z.s = d.createElement(s)
    e = d.getElementsByTagName(s)[0]
    jivo_id = 'XEuAh5JNpR'

    z.set = (o) ->
      z.set._.push o
      return

    z._ = []
    z.set._ = []
    $.async = !0
    el_script.setAttribute 'charset', 'utf-8'
    el_script.src = '//code.jivosite.com/script/widget/' + jivo_id
    z.t = +new Date
    el_script.type = 'text/javascript'
    e.parentNode.insertBefore el_script, e
    return
  ) document, 'script'
  return

jQuery(document).on 'turbolinks:load', runChat
jQuery(document).ready ($) ->
  runChat()
  return
