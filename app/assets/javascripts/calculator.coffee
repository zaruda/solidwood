$(document).on 'turbolinks:load', ->
  $capacityCalculator = $('.calculator#capacity')
  $countCaclulator = $('.calculator#count')

  $capacityCalculator.submit (event) ->
    event.preventDefault()
    form = $(this).serializeObject()
    capacity = form.count * ((form.width / 1000) * (form.thickness / 1000) * form.length)
    $(this).find('input[name="capacity"]').val(capacity.toFixed(3))

  $countCaclulator.submit (event) ->
    event.preventDefault()
    form = $(this).serializeObject()
    count = form.capacity / ((form.width / 1000) * (form.thickness / 1000) * form.length)
    $(this).find('input[name="count"]').val(count.toFixed(3))