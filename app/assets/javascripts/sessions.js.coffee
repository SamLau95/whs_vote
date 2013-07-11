# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	width = $(window).width()
	new_class = if width < 785 then 'pagination-centered' else ''
	$(document.body).removeClass('pagination-centered').addClass(new_class)