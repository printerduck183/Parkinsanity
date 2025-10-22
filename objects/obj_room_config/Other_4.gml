
_room_start_time = obj_gameplay.CurrentTime();

if (is_level)
{
	layer_set_visible(obj_gameplay._ui_levelplay, true);
	layer_set_visible(obj_gameplay._ui_levelsplash, true);
	
	if (enable_timer)
	{
		instance_activate_object(obj_timer);
		instance_activate_object(obj_timer_tens);
		instance_activate_object(obj_timer_units);
		obj_timer.Reset(max_time);
	}
	else
	{
		instance_deactivate_object(obj_timer);
		instance_deactivate_object(obj_timer_tens);
		instance_deactivate_object(obj_timer_units);
	}
}
else
{
	layer_set_visible(obj_gameplay._ui_levelplay, false);
	layer_set_visible(obj_gameplay._ui_levelsplash, false);
}

layer_set_visible(obj_gameplay._ui_pause, false);
layer_set_visible(obj_gameplay._ui_controls, false);

