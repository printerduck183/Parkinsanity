
if not(freeze_timer)
{
	time_remaining -= delta_time * 0.000001;
	if (time_remaining < 0.005)
	{
		global.level_passed = -1;
	}

	// update UI
	var tens = floor(time_remaining * 0.1);
	obj_timer_tens.image_index = tens;
	
	var old_units = obj_timer_units.image_index;
	var units = floor(time_remaining % 10);
	obj_timer_units.image_index = units;
	
	// play ticking sound when only 10s left
	if (tens == 0 && units <= 10 && units != old_units)
	{
		audio_play_sound(snd_ticking, 1, false);
	}
}

