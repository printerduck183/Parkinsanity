
if (move.cur_speed < 4)
{
	if (gear < 0)
	{
		gear = 1;
	}
	else
	{
		gear = -1;
	}

	var switch_gear = instance_create_depth(x-32, y-140, depth - 2, obj_switch_gear);
	switch_gear.image_index = gear > 0 ? 0 : 1;
}

