
if (start_move == false)
{
	// check player's distance
	var dist = distance_to_object(obj_player);
	if (dist < 300)
	{
		start_move = true;
		path_start(pth_rm_level_6_2, 5, path_action_stop, true);
	}
}
else if (path_index != -1)
{
	image_angle = direction;
}

