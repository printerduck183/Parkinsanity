
if (start_move == false)
{
	// check player's distance
	var dist = distance_to_object(obj_player);
	if (obj_player.x > 316)
	{
		start_move = true;
		path_start(pth_rm_level_8_1, 5, path_action_stop, true);
	}
}
else if (path_index != -1)
{
	image_angle = direction;
}

