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
		if num < 6 and not exercise.is('.finished')
			exercise.addClass('started')
			FIVE.active.removeClass('active') unless not FIVE.active?
			exercise.addClass('active')
			FIVE.active = exercise
			FIVE.timer = exercise.find('.timer')
			num++
			exercise.find('.num').text(num) unless num == 6
			if num == 6
				exercise.addClass('finished')
				FIVE.timer = undefined
				FIVE.checkFinished()
	checkFinished: ->
		if $('.exercise').not('.finished').length == 0
			$('.complete').addClass('btn-success')

setInterval (->
		if FIVE.timer?
			time = parseInt(FIVE.timer.data('time'))
			time++
			FIVE.timer.data('time', time)
			FIVE.timer.text(Math.floor(time / 60) + ":" + ((time % 60 + 100).toString().substring(1)))
	), 1000
