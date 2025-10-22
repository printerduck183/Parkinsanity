
if (path_index != -1)
{
	image_angle = direction;
}

if (standby == true && instance_exists(obj_player))
{
	if (obj_player.x < 848 && obj_player.y > 424 && obj_player.x > 756 && obj_player.y < 484) 
	{
		path_start(pth_rm_level_11_2, 5, path_action_stop, true);
		standby = false;
	}
}

