# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$('div.btn-group[name=*]').each ->
		group = $(this)
		form = group.parents('form').eq(0)
		name = group.attr('name')
		hidden = $('input[name="' + name + '"]', form)
		$('button', group).each ->
			button = $(this)
			button.live "click", ->
				hidden.val $(this).val()
			button.addClass 'active' if button.val() is hidden.val()