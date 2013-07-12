# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	width = $(window).width()
	if width < 785
		$(document.body).removeClass('pagination-centered').addClass('pagination-centered')
	else
		$(document.body).removeClass('pagination-centered')