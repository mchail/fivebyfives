$ ->
	$('.exercise').click ->
		FIVE.clickHandler($(this))
	$('.cancel').click ->
		window.location.reload()

FIVE =
	active: undefined
	timer: undefined
	clickHandler: (exercise) ->
		if !active? or exercise != active
			FIVE.increment(exercise)
	increment: (exercise) ->
		num = parseInt(exercise.find('.num').text())
		if num < 6
			exercise.addClass('started')
			FIVE.active.removeClass('active') unless not FIVE.active?
			exercise.addClass('active')
			FIVE.active = exercise
			timer = exercise.find('.timer')
			num++
			exercise.find('.num').text(num) unless num == 6
			if num == 6
				exercise.addClass('finished')
				timer = undefined
				console.log(FIVE.checkFinished())
	checkFinished: ->
		if $('.exercise').not('.finished').length == 0
			$('.complete').addClass('btn-success')
