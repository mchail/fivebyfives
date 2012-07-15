$ ->
	$('.exercise').click ->
		FIVE.clickHandler($(this))
	$('.cancel').click ->
		window.location.reload()
	# $('.exercise').swipe(
	# 	swipeLeft: ->
	# 		$(this).addClass('failure')
	# 	swipeRight: ->
	# 		$(this).addClass('finished').removeClass('failure')
	# )

	$('.complete').click ->
		form = $('#complete_workout_form')
		$('.exercise').each (i, v) ->
			ex = $(v)
			exid = ex.attr('id')
			weight = ex.find('.weight').text()
			time = ex.find('.timer').text()
			name = ex.find('.ex-name').text()
			reps = ex.find('.num').text()
			form.append($('<input>').attr('name', 'ex[' + exid + "][weight]").attr('value', weight))
			form.append($('<input>').attr('name', 'ex[' + exid + "][time]").attr('value', time))
			form.append($('<input>').attr('name', 'ex[' + exid + "][name]").attr('value', name))
			form.append($('<input>').attr('name', 'ex[' + exid + "][reps]").attr('value', reps))
		form.submit()

	$('.increase').click (e) ->
		e.preventDefault()
		input = $(this).parent().find('input')
		text = $(this).parent().find('.current')
		input.val(parseInt(input.val()) + 5)
		text.text(parseInt(text.text()) + 5)
	$('.decrease').click (e) ->
		e.preventDefault()
		input = $(this).parent().find('input')
		text = $(this).parent().find('.current')
		input.val(parseInt(input.val()) - 5)
		text.text(parseInt(text.text()) - 5)

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
