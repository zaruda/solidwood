document.addEventListener 'turbolinks:load', (event) ->
  if typeof ym is 'function'
    ym(<%= ENV['YANDEX_METRIKA_ID'] %>, 'hit', event.data.url)
