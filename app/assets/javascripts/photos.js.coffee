# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $(".like-link").on "ajax:success", (event, data) ->
    $("#likebox span").html(data.count)
  $(".remote_link").on "ajax:success", (event, data) ->
    $("#random_photo").html(data)


$(document).ready(ready)
$(document).on('page:load', ready)    