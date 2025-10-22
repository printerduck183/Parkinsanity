
if (path_index != -1)
{
	image_angle = direction + 180;
}

if (standby == true && instance_exists(obj_player))
{
	if (obj_player.x < 664 && obj_player.y > 448 && obj_player.x > 600 && obj_player.y < 524) 
	{
		path_start(pth_rm_level_11_1, 5, path_action_stop, true);
		standby = false;
	}
}

