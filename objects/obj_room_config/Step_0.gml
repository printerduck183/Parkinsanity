
if (is_level && _room_start_time >= 0)
{
	var cur_time = obj_gameplay.CurrentTime();
	if (_room_start_time + 2 < cur_time)
	{
		_room_start_time = -1;  // prevent coming here again
		layer_set_visible(obj_gameplay._ui_levelsplash, false);
	}
}